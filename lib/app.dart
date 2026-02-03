import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dev_nexus/features/auth/presentation/pages/login_page.dart';
import 'package:dev_nexus/features/auth/presentation/pages/register_page.dart';
import 'package:dev_nexus/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:dev_nexus/screens/home_screen.dart';

class DevNexusApp extends StatelessWidget {
  const DevNexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Nexus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A2E44),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins', 
      ),
      home: const AuthWrapper(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 1. حالة التحميل
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        
        // 2. إذا كان المستخدم مسجلاً للدخول
        if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        }
        
        // 3. إذا لم يكن مسجلاً للدخول
        return const LoginScreen();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2E44),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // شعار التطبيق مع تأثيرات متحركة
            TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A2E44),
                      const Color(0xFF4DB6AC),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(
                        Icons.code,
                        size: 70,
                        color: Colors.white,
                      ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 50),
            
            // مؤشر التحميل مع حركة
            TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, _) {
                return CircularProgressIndicator(
                  value: value,
                  color: Colors.white,
                  strokeWidth: 3,
                  backgroundColor: Colors.white.withOpacity(0.2),
                );
              },
            ),
            
            const SizedBox(height: 35),
            
            // النص مع تأثير التلاشي
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1500),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Column(
                children: [
                  const Text(
                    'Dev Nexus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Elevating Developers Worldwide',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}