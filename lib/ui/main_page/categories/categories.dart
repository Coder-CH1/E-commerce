import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_widgets.dart';

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

