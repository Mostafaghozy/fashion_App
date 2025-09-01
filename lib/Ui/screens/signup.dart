import 'package:e_commerce/Ui/screens/confirmScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  bool _isEmailFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isEmailFilled = _emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 60),
                // Replace with your actual logo widget or Image
                Center(child: Image.asset('assets/logo.png', height: 80)),
                const SizedBox(height: 60),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    'Sign up with Apple',
                    style: TextStyle(fontFamily: 'Jost-Bold.ttf'),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {},
                  // You might need a custom Google icon here
                  icon: Image.asset(
                    'assets/google.png',
                    height: 24,
                    width: 24,
                  ), // Assuming you have a google logo asset
                  label: const Text(
                    'Sign up with Google',
                    style: TextStyle(fontFamily: 'Jost-Bold.ttf'),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "What's your work email?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                      fontFamily: 'Jost',
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfirmScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isEmailFilled
                        ? Colors.yellow
                        : Colors.grey[800],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: _isEmailFilled ? Colors.black : Colors.white,
                      fontFamily: 'Jost',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already use zimro? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost-Bold.ttf',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Log in screen
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.yellow,
                          // decoration: TextDecoration.underline,
                          fontFamily: 'Jost',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Jost',
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(text: 'By signing up you accept the '),
                        TextSpan(
                          text: '\nTerm of service',
                          style: TextStyle(color: Colors.yellow),
                          // recognizer: TapGestureRecognizer()..onTap = () => launch('URL'),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.yellow),
                          // recognizer: TapGestureRecognizer()..onTap = () => launch('URL'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
