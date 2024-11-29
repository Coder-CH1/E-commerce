import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
     body: Column(
       children: [
         Container(
           height: screenHeight/2,
             width: screenWidth,
             decoration: const BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('asset/images/mainImage.png'),
                 fit: BoxFit.cover,
               ),)),
       ],
     ),
    );
  }
}
