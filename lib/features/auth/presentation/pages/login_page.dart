import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'register_page.dart';
import 'package:dev_nexus/core/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  
  Future<void> _handleForgotPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showSnackBar("Write your email first, then press Forgot Password");
      return;
    }

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showSnackBar("Reset link sent to your email ");
    } on FirebaseAuthException catch (e) {
      String msg = "Failed to send reset email";
      if (e.code == 'user-not-found') msg = "This email is not registered";
      if (e.code == 'invalid-email') msg = "Invalid email format";
      if (e.code == 'too-many-requests') msg = "Too many requests, try later";
      _showSnackBar(msg);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Please fill in all fields");
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await AuthService().login(
        email: email,
        password: password,
      );

      if (!mounted) return;

      if (result == "success") {
        _showSnackBar("Welcome back!");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showSnackBar(result ?? "Login failed");
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars(); 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: CustomPaint(
              painter: _ElectronicThreadsPainter(),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width > 500 ? 420 : size.width * 0.92,
                  ),
                  child: Card(
                    elevation: 28,
                    shadowColor: Colors.black.withValues(alpha: 0.25), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 38,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/image/logo.png',
                            height: 150, 
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A2E44).withValues(alpha: 0.1), 
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.code,
                                color: Color(0xFF1A2E44),
                                size: 80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            "Welcome to Dev Nexus",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A2E44),
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 42),
                          _inputField(
                            controller: _emailController,
                            hint: "Email address",
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          _inputField(
                            controller: _passwordController,
                            hint: "Password",
                            icon: Icons.lock_outline,
                            obscure: true,
                            toggle: true,
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A2E44),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 8,
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            children: [
                              TextButton(
                                onPressed: _handleForgotPassword,
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color(0xFF4DB6AC),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Create New Account",
                                  style: TextStyle(
                                    color: Color(0xFF4DB6AC),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    bool toggle = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure ? _obscurePassword : false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          suffixIcon: toggle
              ? IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey[500],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }
}

class _ElectronicThreadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final mainPaint = Paint()
      ..color = const Color(0xFF1A2E44).withValues(alpha: 0.06) 
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final accentPaint = Paint()
      ..color = const Color(0xFF4DB6AC).withValues(alpha: 0.08) 
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 6; i++) {
      final radius = 120.0 + i * 70;
      final rect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawArc(
        rect,
        math.pi * (0.2 * i),
        math.pi * 1.3,
        false,
        accentPaint,
      );
    }

    
    final random = math.Random(42); 
    for (int i = 0; i < 8; i++) {
      final path = Path()
        ..moveTo(size.width * random.nextDouble(), 0)
        ..cubicTo(
          size.width * 0.2,
          size.height * random.nextDouble(),
          size.width * 0.8,
          size.height * random.nextDouble(),
          size.width * random.nextDouble(),
          size.height,
        );

      canvas.drawPath(path, mainPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
