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
         GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3,
               childAspectRatio: (screenWidth/3) / (screenHeight/8),
             ),
             itemCount: items.length,
             itemBuilder: (context, index) {
               final item = items[index];
               return GridTile(
                   child: Container(
                      height: screenHeight/8,
                     width: screenWidth/3,
                     decoration: const BoxDecoration(
                       image: DecorationImage(
                           image: NetworkImage(''),
                         fit: BoxFit.cover,
                       )
                     ),
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

      ),
      body: Column(
        children: [
          Expanded(
              child: _buildContentForSegments(_selectedIndex))
        ],
      )
    );
  }
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

class Men extends StatefulWidget {
  const Men({super.key});

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
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
    return const Scaffold(

    );
  }
}
