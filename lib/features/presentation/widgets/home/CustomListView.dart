import 'package:e_commerce/features/presentation/widgets/home/CardItem.dart';
import 'package:flutter/cupertino.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CardItem(
            image: 'assets/modelGirl1.png',
            title: 'Green Long Sleeve \nShirt',
            price: '100',
          );
        },
      ),
    );
  }
}
