import 'package:e_commerce/presentation/widgets/CustomBottomNavBar.dart';
import 'package:e_commerce/presentation/widgets/RowProfileWidget.dart';
import 'package:e_commerce/presentation/widgets/profile/PersonInformation/personalInformationWidget.dart';
import 'package:e_commerce/presentation/widgets/profile/address/addressBook.dart';

import 'package:e_commerce/presentation/screens/home/MainScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/Close Square.png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/profile.png", width: 60),
              SizedBox(height: 10),
              Text(
                "Ashan Niroshana",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "Account Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              PersonalInformation(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),

              AddressBook(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/credit-card.png',
                title: 'My payment option',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/bell.png',
                title: 'Notification',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "My Order",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/Heart.png',
                title: 'Wishlist',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/codesandbox.png',
                title: 'My order',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              /////////////////////////////
              Text(
                "Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/help-circle.png',
                title: 'Get help',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/activity.png',
                title: 'Order Tracking',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/edit-3.png',
                title: 'Give us feedback',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "Legal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/Shield Done.png',
                title: 'Term & conditions',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/shield.png',
                title: 'Privacy policy',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(initialIndex: index),
            ),
          );
        },
      ),
    );
  }
}
