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
      body: Column(
          children: [
            const SizedBox(height: 10),
            _buildCustomSegmentedControl(),
            Expanded(
              child: _buildContentForSegments(_selectedIndex),
            ),
          ]
      ),
    );
  }
  Widget _buildCustomSegmentedControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSegments('Men', 0),
        _buildSegments('Women', 1),
        _buildSegments('Kids', 2),
      ],

    );
  }
  ///
  Widget _buildSegments(String label, int index) {
    bool isSelected = _selectedIndex == index;
    double segmentWidth = MediaQuery.of(context).size.width/3;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 45),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(label, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: _selectedIndex == index ? Colors.black : Colors.grey,
                ),
                ),
              ),
            ],
          ),
        ),
        isSelected ? Align(
          alignment: FractionalOffset.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 1, left: 0, right: 40),
            //padding:  EdgeInsets.only(right: 0, left: 0),
            height: 2,
            width: segmentWidth,
            color: redColor,
          ),
        )
            : Container(),
      ],
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
    //double width = MediaQuery.of(context).size.width/4;
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: GridTile(
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: Card(
                        color: redColor,
                        child: CustomText(
                            text: 'hi',
                            style: TextStyle()
                        ),
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

