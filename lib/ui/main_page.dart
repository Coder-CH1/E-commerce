import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white24,
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List items = [];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.red,
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
                  right: screenWidth/4.5,
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
          const Spacer(),
          Row(
            children: [
              const CustomText(
                text: 'New',
                style: TextStyle(color: darkBlue),
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
            height: 20,
          ),
          const CustomText(
              text: 'You have never seen it before!',
              style: TextStyle()
          ),
          const SizedBox(
              height: 20
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (screenWidth/3) / (screenHeight/8),
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GridTile(
                    child: SizedBox(
                      height: screenHeight/8,
                      width: screenWidth/3,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: const CustomText(
                              text: '',
                              style: TextStyle()),
                        ),
                      ),
                    )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

///
class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}

///
class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}

///
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


///
class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<Categories> createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const
                Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
            ),
            title: 'Categories', textStyle: const TextStyle(fontSize: 22),
            trailingWidget: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search),
            )
        ),
        body: Column(
          children: [
            Expanded(
                child: _buildContentForSegments(_selectedIndex))
          ],
        )
    );
  }

  ///
  Widget _buildSegments(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Text(label, style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _selectedIndex == index ? Colors.black : Colors.grey,
        ),
        ),
      ),
    );
  }

  ///
  Widget _buildContentForSegments(int segment) {
    switch (segment) {
      case 0:
        return const Women();
      case 1:
        return const Men();
      case 2:
        return const Kids();
      default:
        return const Center(child: Text('default'));
    }
  }
}

///
class Women extends StatefulWidget {
  const Women({super.key});
  @override
  State<Women> createState() => _WomenState();
}
class _WomenState extends State<Women> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return GridTile(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('')
                        )
                    ),
                    child: const CustomText(
                        text: '',
                        style: TextStyle()
                    ),
                  )
              );
            }
        )
    );
  }
}

///
class Men extends StatefulWidget {
  const Men({super.key});
  @override
  State<Men> createState() => _MenState();
}
class _MenState extends State<Men> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Kids extends StatefulWidget {
  const Kids({super.key});

  @override
  State<Kids> createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

