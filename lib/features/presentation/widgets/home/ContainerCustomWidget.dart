import 'package:flutter/material.dart';

class ContainerCustomWidget extends StatelessWidget {
  const ContainerCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/Rectangle 17.png", fit: BoxFit.cover),
            ),
          ),
          //// pure black semi-transparent overlay
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(color: Colors.black.withOpacity(0.60)),
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Text(
              "Get up to 30% Off \nNew Arrivals",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 35,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 147, 137, 50),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
