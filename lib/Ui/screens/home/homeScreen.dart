import 'package:e_commerce/Ui/screens/auth/loginScreen.dart';
import 'package:e_commerce/Ui/widgets/CollectionsFilterBar.dart';
import 'package:e_commerce/Ui/widgets/ContainerCustomWidget.dart';
import 'package:e_commerce/Ui/widgets/appbarCustomWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 18)),
            Text(
              "zimro store!",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 15),
            ContainerCustomWidget(),
            SizedBox(height: 10),
            CollectionsFilterBar(),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "All collections",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ()),
                    // );
                  },
                  child: Row(
                    children: [
                      Text("See all"),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
