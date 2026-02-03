import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'register_page.dart';
import 'forgot_password_page.dart';
import 'package:dev_nexus/core/auth_service.dart';

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

  void _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar("Please fill in all fields");
      return;
    }

    setState(() => _isLoading = true);

    final result = await AuthService().login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result == "success") {
      _showSnackBar("Welcome back!");
     
  
    } else {
      _showSnackBar(result ?? "Login failed");
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          ///  الخلفية 
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
                    shadowColor: Colors.black.withOpacity(0.25),
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
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF1A2E44).withOpacity(0.1),
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
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
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
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure ? _obscurePassword : false,
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
      ..color = const Color(0xFF1A2E44).withOpacity(0.06)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final accentPaint = Paint()
      ..color = const Color(0xFF4DB6AC).withOpacity(0.08)
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    //  (أقواس)
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

    // مسارات منحنيةة
    for (int i = 0; i < 8; i++) {
      final path = Path()
        ..moveTo(
          size.width * math.Random(i).nextDouble(),
          0,
        )
        ..cubicTo(
          size.width * 0.2,
          size.height * math.Random(i + 2).nextDouble(),
          size.width * 0.8,
          size.height * math.Random(i + 4).nextDouble(),
          size.width * math.Random(i + 6).nextDouble(),
          size.height,
        );

      canvas.drawPath(path, mainPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}