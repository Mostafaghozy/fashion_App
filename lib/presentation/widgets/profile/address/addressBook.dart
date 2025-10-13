import 'package:e_commerce/presentation/widgets/RowProfileWidget.dart';
import 'package:e_commerce/presentation/widgets/profile/address/editAddressBook.dart';

import 'package:flutter/material.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({super.key});

  @override
  Widget build(BuildContext context) {
    return RowProfileWidget(
      imageAsset: 'assets/icons/book.png',
      title: 'Address Book',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditAddressBook()),
        );
      },
    );
  }
}
