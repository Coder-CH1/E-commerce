import 'dart:math';
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/tabbars/profile_page.dart';
import 'package:ecommerce/tabbars/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'bag_page.dart';
import 'favorites_page.dart';

///
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => MainPageState();
}
class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    const Home(),
    const Shop(),
    const Bag(),
    const Favorites(),
    const Profile(),
  ];

  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _itemTapped,
        selectedItemColor: redColor,
        unselectedItemColor: grayColor,
        selectedLabelStyle: const TextStyle(
          color: redColor,
        ),
        backgroundColor: darkBlue,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? redColor : grayColor)),
          BottomNavigationBarItem(
              label: 'Shop',
              icon: Icon(Icons.shopping_cart, color: _selectedIndex == 1 ? redColor : grayColor)),
          BottomNavigationBarItem(
              label: 'Bag',
              icon: Icon(Icons.shopping_bag, color: _selectedIndex == 2 ? redColor : grayColor)),
          BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite, color: _selectedIndex == 3 ? redColor : grayColor)),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person, color: _selectedIndex == 4 ? redColor : grayColor)),
        ],
      ),
    );
  }
}

/// TAB 0: HOME
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> listHeader = ['New In','Top Selling'];
  @override
  Widget build(BuildContext context) {
    List items = [];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: opacityWhite,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: screenHeight/1.8,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/mainImage.png'),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                  Positioned(
                      top: screenHeight/3.5,
                      right: screenWidth/2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                              text: 'Fashion',
                              style: TextStyle(fontSize: 50, color: whiteColor, fontWeight: FontWeight.bold)),
                          const CustomText(
                              text: 'Sale',
                              style: TextStyle(fontSize: 50, color: whiteColor, fontWeight: FontWeight.bold)),
                          CustomButton(
                            text: 'Check',
                            onPressed: (){},
                            color: redColor,
                            buttonHeight: 35,
                            buttonWidth: 140,
                            borderRadius: 18,
                            buttonTextStyle: const TextStyle(color: whiteColor),
                          ),
                        ],
                      )
                  )
                ],
              ),
              gridHeader(),
            ],
          ),
        ),
      ),
    );
  }
  Widget gridHeader() {
    return ListView.builder(
      itemCount: listHeader.length + 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        double height = (index % 2 == 0) ? 250.0 : 150.0;
        double width = Random().nextInt(70) + 60.0;
        if (index < listHeader.length) {
          return StickyHeader(
            header: Container(
                height: 38.0,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(listHeader[index],
                      style: const TextStyle(color: redColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 180),
                    CustomTextButton(
                      text: 'See All',
                      onPressed: () {},
                      buttonTextStyle: const TextStyle(color: Colors.red),
                    ),
                  ],
                )
            ),
            content: SizedBox(
                height: height,
                //width: width,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: height,
                            width: width,
                            child: Card(
                              margin: const EdgeInsets.all(4.0),
                              color: redColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 12.0, top: 6.0, bottom: 2.0),
                                child: Center(
                                    child: Text('New',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: whiteColor),)
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 2),
            child: SizedBox(
              height: 250,
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Tile(imageAsset: 'assets/images/img02.png', text: 'New collection', ontap: () {},),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Tile(imageAsset: 'assets/images/img03.png', text: 'Trendy', ontap: () {},),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(imageAsset: 'assets/images/img03.png', text: 'Cutiez', ontap: () {},),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(imageAsset: 'assets/images/img02.png', text: 'Image 4', ontap: () {},),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
