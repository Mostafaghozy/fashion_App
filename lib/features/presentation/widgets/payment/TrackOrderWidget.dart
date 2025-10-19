import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrackOrderWidget extends StatelessWidget {
  const TrackOrderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.color,
  });
  final String image;
  final String title;
  final String subtitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        Gap(10),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: color ?? Colors.black,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.access_time, size: 20, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
