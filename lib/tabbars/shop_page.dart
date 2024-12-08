import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';

/// TAB 1: SHOP
class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: darkBlue,
      ),
    );
  }
}