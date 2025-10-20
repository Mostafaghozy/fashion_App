import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContainerWidgetNotification extends StatelessWidget {
  const ContainerWidgetNotification({
    super.key,
    required this.image,
    required this.text,
    this.bottomText,
  });
  final String image;
  final String text;
  final String? bottomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image),
          ),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Gap(10),
              Text(
                bottomText ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
