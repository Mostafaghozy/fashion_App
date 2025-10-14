import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
              ),
              Gap(10),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Gap(10),
              GestureDetector(
                onTap: () {
                  setState(() => quantity++);
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Spacer(),

        Icon(Icons.close, color: Colors.white70, size: 30),
      ],
    );
  }
}
