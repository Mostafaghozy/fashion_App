import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextButtonMarkAllWidget extends StatelessWidget {
  const TextButtonMarkAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.check,
                size: 20,
                color: Color.fromARGB(255, 10, 92, 159),
              ),
              Positioned(
                top: 1,
                right: 12,
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Color.fromARGB(255, 10, 92, 159),
                ),
              ),
            ],
          ),
          Gap(5),

          Text(
            'Mark all as read',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 10, 92, 159),
            ),
          ),
        ],
      ),
    );
  }
}
