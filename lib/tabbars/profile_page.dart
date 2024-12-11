import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


/// TAB 4: PROFILE
class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  User? _currentUser;
  @override
  void initState(){
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    String userEmail = _currentUser?.email ?? 'No email available';
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
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.person_pin)
                ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomText(text: 'Email:', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomText(text: userEmail, style: const TextStyle()),
            ],
          )
            ],
          ),
        ],
      )
    );
  }
}