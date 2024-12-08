import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';

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
      body: Container(
        color: grayColor,
      ),
    );
  }
}