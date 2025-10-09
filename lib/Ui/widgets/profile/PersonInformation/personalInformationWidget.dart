import 'package:e_commerce/Ui/widgets/RowProfileWidget.dart';
import 'package:e_commerce/Ui/widgets/profile/PersonInformation/edit_personal_info.dart';

import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return RowProfileWidget(
      imageAsset: 'assets/icons/user.png',
      title: 'Personal information',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditPersonalInfo()),
        );
      },
    );
  }
}
