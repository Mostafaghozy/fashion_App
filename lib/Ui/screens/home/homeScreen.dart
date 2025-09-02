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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 18)),
            Text(
              "zimro store!",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            ContainerCustomWidget(),
            SizedBox(height: 10),
            CollectionsFilterBar(),
          ],
        ),
      ),
    );
  }
}
