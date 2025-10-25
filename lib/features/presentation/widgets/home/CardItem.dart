import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });
  final String image, title, price;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(image, height: 200, fit: BoxFit.cover),
                  Positioned(
                    top: 7,
                    right: 5,
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.heart,
                          size: 18,
                          color: Colors.black,
                        ),
                        Gap(140),

                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xffC9C52E),
                          child: Icon(CupertinoIcons.bag, size: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Gap(10),
            Text(
              title,
              softWrap: true,
              maxLines: 2,

              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$$price",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
