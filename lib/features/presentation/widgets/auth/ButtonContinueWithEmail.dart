import 'package:e_commerce/features/presentation/screens/auth/confirmScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

class ButtonContinueWithEmail extends StatelessWidget {
  const ButtonContinueWithEmail({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();
        // EMAIL EMPTY
        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please enter your email',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.yellow,
            ),
          );
          return;
        }

        // EMAIL INVALID
        if (!isValidEmail(email)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please enter a valid email address',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.yellow,
            ),
          );
          return;
        }
        // PASSWORD EMPTY
        if (password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please enter your password',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.yellow,
            ),
          );
          return;
        }

        // PASSWORD TOO SHORT
        if (password.length < 8) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Password must be at least 8 characters',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.yellow,
            ),
          );
          return;
        }

        // ALL GOOD → GO NEXT SCREEN
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow.shade500,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('Continue with email', style: TextStyle(color: Colors.black)),
    );
  }
}
