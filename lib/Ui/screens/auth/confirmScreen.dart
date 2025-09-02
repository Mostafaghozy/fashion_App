import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Check your email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              Image.asset(
                'assets/gif.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 5),
              Text(
                'We sent an email to zimrofashion@gmail.com to \nverify your account',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Jost-Bold.ttf',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement open email app functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Open email',
                  style: TextStyle(
                    fontFamily: 'Jost-Bold.ttf',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
