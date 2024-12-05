import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_widgets.dart';

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
        ),
        background: opacityWhite,
      ),
      body: CategoriesSegmentedControl(),
    );
  }
}

class CategoriesSegmentedControl extends StatefulWidget {
  const CategoriesSegmentedControl({Key? key}) : super(key: key);

  @override
  State<CategoriesSegmentedControl> createState() => _CategoriesSegmentedControlState();
}

class _CategoriesSegmentedControlState extends State<CategoriesSegmentedControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      )
    );
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GridTile(
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: Card(
                        color: redColor,
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.favorite_border)
                        )
                      ),
                    )
                ),
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
    return const Scaffold();
  }
}

