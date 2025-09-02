import 'package:e_commerce/Ui/screens/auth/confirmScreen.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
      backgroundColor: Colors.grey[900],
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
                    'Log in with Apple',
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
                    'Log in with Google',
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
                  "Email",
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
                    'Continue with email',
                    style: TextStyle(
                      color: _isEmailFilled ? Colors.black : Colors.white,
                      fontFamily: 'Jost',
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
