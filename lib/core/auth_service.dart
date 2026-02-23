import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  
  User? get currentUser => _auth.currentUser;

  
  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      
      final result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final uid = result.user?.uid;
      if (uid == null) return "SIGNUP ERROR: uid-null";

      
      try {
        await result.user!.updateDisplayName(name.trim());
        await result.user!.reload(); 
      } catch (e) {
        debugPrint(" updateDisplayName failed: $e");
      }

      
      try {
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'name': name.trim(),
          'email': email.trim(),
          'createdAt': FieldValue.serverTimestamp(),
          'photoUrl': null, 
        });
      } on FirebaseException catch (e) {
        debugPrint("❌ FIRESTORE ERROR | code: ${e.code} | message: ${e.message}");
        
      } catch (e) {
        debugPrint("❌ FIRESTORE ERROR: $e");
      }

      return "success";
    } on FirebaseAuthException catch (e) {
      debugPrint("❌ SIGNUP AUTH ERROR | code: ${e.code} | message: ${e.message}");
      return _handleAuthError(e.code);
    } catch (e) {
      debugPrint("❌ SIGNUP ERROR: $e");
      return "Authentication failed";
    }
  }

  
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      debugPrint("❌ LOGIN AUTH ERROR | code: ${e.code} | message: ${e.message}");
      return _handleAuthError(e.code);
    } catch (e) {
      debugPrint("❌ LOGIN ERROR: $e");
      return "An unexpected error occurred during login";
    }
  }

  
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return "success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    } catch (e) {
      return "Error sending reset email";
    }
  }

  
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint("❌ SIGNOUT ERROR: $e");
    }
  }

 
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      debugPrint("❌ GET USER DATA ERROR: $e");
      return null;
    }
  }

  
  Future<bool> updateUserProfile({
    required String uid,
    required String name,
    String? photoUrl,
  }) async {
    try {
     
      Map<String, dynamic> updateData = {'name': name.trim()};
      if (photoUrl != null) updateData['photoUrl'] = photoUrl;

      await _firestore.collection('users').doc(uid).update(updateData);

      
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name.trim());
        if (photoUrl != null) {
          await user.updatePhotoURL(photoUrl);
        }
        await user.reload();
      }
      return true;
    } catch (e) {
      debugPrint("❌ UPDATE PROFILE ERROR: $e");
      return false;
    }
  }

 
  String _handleAuthError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential': 
        return "Invalid email or password";
      case 'email-already-in-use':
        return "This email is already registered. Please login";
      case 'weak-password':
        return "Password is too weak. Please use a stronger one";
      case 'invalid-email':
        return "The email address format is invalid";
      case 'user-disabled':
        return "This account has been disabled by the administrator";
      case 'too-many-requests':
        return "Too many failed attempts. Please try again later";
      case 'operation-not-allowed':
        return "Email/Password sign-in is not enabled in Firebase Console";
      case 'requires-recent-login':
        return "Security sensitive: Please login again to perform this action";
      case 'network-request-failed':
        return "Network error. Please check your internet connection";
      default:
        return "Authentication failed. Please try again ($errorCode)";
    }
  }
}