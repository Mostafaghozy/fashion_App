import 'package:e_commerce/Ui/widgets/imageCustom.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageCustom(imagePath: "assets/main.png"),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(child: Image.asset("assets/logo.png")),
        ],
      ),
    );
  }
}
