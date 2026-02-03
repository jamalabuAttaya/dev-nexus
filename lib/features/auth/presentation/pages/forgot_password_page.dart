import 'package:flutter/material.dart';
import 'package:dev_nexus/core/auth_service.dart';
import 'dart:math' as math;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // منطق إعادة تعيين كلمة المرور
  void _handleResetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showSnackBar("Please enter your email address");
      return;
    }

    setState(() => _isLoading = true);

    final result = await AuthService().resetPassword(email);

    setState(() => _isLoading = false);

    if (result == "success") {
      _showSnackBar("Reset link has been sent to your email!");
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) Navigator.pop(context);
      });
    } else {
      _showSnackBar(result ?? "An error occurred");
    }
  }

  void _showSnackBar(String message) {
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
          ///  الخلفية الإلكترونية (نفس الخلفية تماماً)
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
                          
                          const SizedBox(height: 30),

                          
                          Image.asset(
                            'assets/image/logo.png',
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 95,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A2E44).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.lock_reset,
                                color: Color(0xFF1A2E44),
                                size: 50,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          const Text(
                            "Reset Your Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A2E44),
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Enter your registered email address below to receive your password reset link.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF607D8B),
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          const SizedBox(height: 42),

                          ///  حقل الإيميل
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email address',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: Colors.grey[500]),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 16),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          /// زر إرسال رابط الإعادة
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed:
                                  _isLoading ? null : _handleResetPassword,
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
                                      "Send Reset Link",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          ///  رابط العودة لتسجيل الدخول
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Back to Login",
                              style: TextStyle(
                                color: Color(0xFF4DB6AC),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
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
}

///  الخلفيه
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

    //مسارات منحنية ة
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