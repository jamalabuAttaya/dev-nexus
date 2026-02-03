import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // الحصول على تيار حالة المصادقة
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // الحصول على المستخدم الحالي
  User? get currentUser => _auth.currentUser;

  // تسجيل حساب جديد
  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      
      await result.user!.updateDisplayName(name);

      // حفظ بيانات المستخدم في Firestore
      await _firestore.collection('users').doc(result.user!.uid).set({
        'uid': result.user!.uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    } catch (e) {
      return "An unexpected error occurred";
    }
  }

  // تسجيل دخول
  Future<String?> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    }
  }

  // استعادة كلمة المرور
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // دالة مساعدة لمعالجة أخطاء Firebase
  String _handleAuthError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return "No user found with this email";
      case 'wrong-password':
        return "Incorrect password";
      case 'email-already-in-use':
        return "Email is already registered";
      case 'weak-password':
        return "Password is too weak";
      case 'invalid-email':
        return "Invalid email address";
      case 'user-disabled':
        return "This account has been disabled";
      case 'operation-not-allowed':
        return "Operation not allowed";
      case 'too-many-requests':
        return "Too many requests. Try again later";
      case 'requires-recent-login':
        return "Please login again to perform this action";
      default:
        return "Authentication failed. Please try again";
    }
  }

  // الحصول على بيانات المستخدم من Firestore
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // تحديث بيانات المستخدم
  Future<void> updateUserProfile({
    required String uid,
    required String name,
    String? photoUrl,
  }) async {
    try {
      Map<String, dynamic> updateData = {'name': name};
      if (photoUrl != null) updateData['photoUrl'] = photoUrl;
      
      await _firestore.collection('users').doc(uid).update(updateData);
      
     
      await _auth.currentUser?.updateDisplayName(name);
      if (photoUrl != null) {
        await _auth.currentUser?.updatePhotoURL(photoUrl);
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  }
}