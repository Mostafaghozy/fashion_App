import 'dart:math' as math;

import 'package:e_commerce/Ui/widgets/imageCustom.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // animate from 0 to pi (180deg) and back -> a flipping effect
    _animation = Tween<double>(
      begin: 0.0,
      end: math.pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Repeat animation back and forth
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageCustom(imagePath: "assets/main.png"),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // add a small perspective
                final transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animation.value);

                return Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: Image.asset("assets/logo.png", width: 140, height: 140),
            ),
          ),
        ],
      ),
    );
  }
}
