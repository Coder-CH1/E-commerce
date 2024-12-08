import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';

/// TAB 2: BAG
class Bag extends StatefulWidget {
  const Bag({super.key});
  @override
  State<Bag> createState() => _BagState();
}
class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        color: redColor,
      ),
    );
  }
}