import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// TAB 4: PROFILE
class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Profile',
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const
            Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
      ),
      body: const Column(
        children: [

        ],
      )
    );
  }
}