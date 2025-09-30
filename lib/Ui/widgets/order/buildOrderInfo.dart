import 'package:flutter/material.dart';

Widget buildOrderInfo() {
  return Column(
    children: [
      Row(
        children: [
          const Text(
            'Placed on June 20, 2022 22:40:32',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          SizedBox(width: 10),
          Row(
            children: [
              Image.asset("assets/icons/truck.png", fit: BoxFit.cover),
              SizedBox(width: 4),
              Text(
                'Estimate delivery: May14,2022',
                style: TextStyle(color: Colors.yellow, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
