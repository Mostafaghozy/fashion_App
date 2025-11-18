import 'package:e_commerce/features/presentation/screens/auth/confirmScreen.dart';
import 'package:e_commerce/features/presentation/screens/home/Root.dart';
import 'package:e_commerce/features/presentation/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

class ButtonContinueWithEmail extends StatelessWidget {
  const ButtonContinueWithEmail({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.text,
    this.confirmPasswordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;

  final String? text;

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
        String? confirmPassword = confirmPasswordController?.text.trim();
        // EMAIL EMPTY
        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please enter your email',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromARGB(255, 192, 187, 37),
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
              backgroundColor: Color.fromARGB(255, 192, 187, 37),
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
              backgroundColor: Color.fromARGB(255, 192, 187, 37),
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
              backgroundColor: Color.fromARGB(255, 192, 187, 37),
            ),
          );
          return;
        }
        // CONFIRM PASSWORD — ONLY IF FIELD EXISTS
        if (confirmPasswordController != null) {
          if (confirmPassword!.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Please confirm your password',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Color.fromARGB(255, 192, 187, 37),
              ),
            );
            return;
          }

          if (password != confirmPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Password do not match',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Color.fromARGB(255, 192, 187, 37),
              ),
            );
            return;
          }
        }

        // ALL GOOD → GO NEXT SCREEN
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RootScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 192, 187, 37),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text ?? 'Continue with email',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
