
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
     List items = [];
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
         const SizedBox(height: 20),
         Row(
           children: [
             const CustomText(
                 text: 'New',
                 style: TextStyle(),
               align: TextAlign.left,
             ),
             const Spacer(),
             CustomTextButton(
                 text: 'View all',
                 onPressed: (){},
                 color: titleAppBarColor,
             )
           ],
         ),
         const SizedBox(
           height: 20
         ),
         const CustomText(
             text: 'You have never seen it before!',
             style: TextStyle()
         ),
         const SizedBox(
           height: 20
         ),
         CustomListView(
             items: items,
             itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    height: screenHeight/8,
                    width: screenWidth/3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('')
                      )
                    ),
                  ),
                  subtitle: const CustomText(
                      text: 'New',
                      style: TextStyle(

                      )),
                );
             }
         )
       ],
     ),
    );
  }
}

class MainPageViewContents extends StatelessWidget {
  const MainPageViewContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final List items;
  const BottomNavigationBar({super.key, required this.items});
  //int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Shop',
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          label: 'Bag',
          icon: Icon(Icons.shopping_bag),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
