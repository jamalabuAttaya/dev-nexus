import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isAgreed = false;
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar("Passwords do not match!");
      return;
    }

    if (_emailController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _showSnackBar("Please fill in all fields");
      return;
    }

    if (!_isAgreed) {
      _showSnackBar("Please agree to the Terms and Conditions");
      return;
    }

    setState(() => _isLoading = true);

    String result;

    try {
      final email = _emailController.text.trim();
      final pass = _passwordController.text.trim();
      final name = _nameController.text.trim();

      // ✅ Create account
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // ✅ Save display name
      await cred.user!.updateDisplayName(name);

      // ✅ Force refresh (important on web)
      await cred.user!.reload();

      result = "success";
    } on FirebaseAuthException catch (e) {
      // ✅ Clear error messages
      result = switch (e.code) {
        'email-already-in-use' => 'This email is already in use.',
        'invalid-email' => 'Invalid email address.',
        'weak-password' => 'Password is too weak.',
        'operation-not-allowed' => 'Email/password sign-in is not enabled.',
        _ => e.message ?? 'Sign up failed.',
      };
    } catch (e) {
      result = "Sign up failed: $e";
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }

    if (!mounted) return;

    if (result == "success") {
      _showSnackBar("Account created successfully!");
      Navigator.pushReplacementNamed(context, '/home'); // أو '/login'
    } else {
      _showSnackBar(result);
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
                              height: 95,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A2E44).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.person_add,
                                color: Color(0xFF1A2E44),
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            "Create New Account",
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
                            controller: _nameController,
                            hint: "Full name",
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 20),
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
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            isObscured: _obscurePassword,
                          ),
                          const SizedBox(height: 20),
                          _inputField(
                            controller: _confirmPasswordController,
                            hint: "Confirm password",
                            icon: Icons.lock_outline,
                            obscure: true,
                            toggle: true,
                            onToggle: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                            isObscured: _obscureConfirmPassword,
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Checkbox(
                                value: _isAgreed,
                                activeColor: const Color(0xFF1A2E44),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _isAgreed = value ?? false;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isAgreed = !_isAgreed;
                                    });
                                  },
                                  child: const Text(
                                    "I agree to the Terms and Conditions",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF455A64),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleSignUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isAgreed
                                    ? const Color(0xFF1A2E44)
                                    : Colors.grey[400],
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
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Already have an account? Login",
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

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    bool toggle = false,
    VoidCallback? onToggle,
    bool? isObscured,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure ? (isObscured ?? true) : false,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          suffixIcon: toggle
              ? IconButton(
                  icon: Icon(
                    (isObscured ?? true)
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey[500],
                  ),
                  onPressed: onToggle,
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
