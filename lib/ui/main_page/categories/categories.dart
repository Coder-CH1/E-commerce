import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_widgets.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<Categories> createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories> {
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
      body: const Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: CategoriesSegmentedControl()),
          ]
      ),
    );
  }
}

class CategoriesSegmentedControl extends StatefulWidget {
  const CategoriesSegmentedControl({super.key});

  @override
  State<CategoriesSegmentedControl> createState() => _CategoriesSegmentedControlState();
}

class _CategoriesSegmentedControlState extends State<CategoriesSegmentedControl> {
  int _currentSelection = 0;
  final List<bool> _selected = [true, false, false];
  final Map<int, Widget> _screen = {
    0: const Men(),
    1: const Women(),
    2: const Kids(),
  };
  final GlobalKey _toggleButtonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Flexible(
              child: ToggleButtons(
                key: _toggleButtonKey,
                onPressed: (int index) {
                  setState(() {
                    _currentSelection = index;
                    for (int i = 0; i < _selected.length; i++) {
                      _selected[i] = i == index;
                    }
                  });
                },
                isSelected: _selected,
                borderColor: Colors.transparent,
                selectedColor: blackColor,
                fillColor: Colors.transparent,
                borderRadius: BorderRadius.zero,
                renderBorder: false,
                children:
                const [
                  CustomText(
                      text: 'Men',
                      style: TextStyle()),
                  Padding(
                    padding: EdgeInsets.only(left: 90, right: 90),
                    child: CustomText(
                        text: 'Women',
                        style: TextStyle()),
                  ),
                  CustomText(
                      text: 'Kids',
                      style: TextStyle()),
                ],
              ),
            ),
            LayoutBuilder(
                builder: (context, contraints) {
                  double segmentWidth = contraints.maxWidth / 3;
                  double lineOffSet = segmentWidth * _currentSelection;

                  return Stack(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(3, (index) {
                              return Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                  height: 2,
                                  width: segmentWidth,
                                  color: _selected[index] ? whiteColor : Colors
                                      .transparent,
                                ),
                              );
                            })
                        ),
                        Positioned(
                            left: lineOffSet,
                            bottom: 0,
                            child: Container(
                              width: segmentWidth,
                              color: redColor,
                              height: 2,
                            )
                        )
                      ]
                  );
                }
            ),
            Expanded(
                child: _screen[_currentSelection]!),
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

