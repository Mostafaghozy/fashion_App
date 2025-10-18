import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContainerChangeAddressWidget extends StatelessWidget {
  const ContainerChangeAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),

      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Main street town hall,",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Gap(5),
          Row(
            children: [
              Text(
                "Sebrestria road,Sri Lanka",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Change address",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 188, 159, 32),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
