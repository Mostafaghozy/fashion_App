import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GridViewAllProduct extends StatelessWidget {
  const GridViewAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 15,
        childAspectRatio: 0.48,
      ),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,

      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/all_product/m.png",
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 7,
                      right: 5,
                      bottom: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            size: 25,
                            color: Colors.black,
                          ),

                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xffC9C52E),
                            child: Icon(CupertinoIcons.bag, size: 22),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(5),
              Text(
                "Women Bottoms Free sizes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(5),
              Text(
                "\$12.99",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
