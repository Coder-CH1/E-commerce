import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_widgets.dart';

///
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
            ToggleButtons(
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
            Flexible(
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
    //double width = MediaQuery.of(context).size.width/4;
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridTile(
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: InkWell(
                    onTap: () {
                      showCustomBottomSheet(context, 'Bottom sheet for the women');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.5,
                            color: redColor,
                          )
                      ),
                      child:  Stack(
                          children:
                          [
                            Positioned(
                              top: 8,
                              left: 8,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border)),
                            ),
                          ]
                      ),
                    ),
                  ),
                )
            ),
          );
        }
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
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 1,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridTile(
                child: SizedBox(
                  height: 300,
                  width: 80,
                  child: InkWell(
                    onTap: () {
                      showCustomBottomSheet(context, 'Bottom sheet for the men');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.5,
                            color: redColor,
                          )
                      ),
                      child:  Stack(
                          children:
                          [
                            Positioned(
                              top: 8,
                              left: 8,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border)),
                            ),
                          ]
                      ),
                    ),
                  ),
                )
            ),
          );
        }
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
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: List.generate(20, (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 300,
            width: 100,
            child: InkWell(
              onTap: () {
                showCustomBottomSheet(context, 'Bottom sheet for the kids');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 0.5,
                      color: redColor,
                    )
                ),
                child:  Stack(
                    children:
                    [
                      Positioned(
                        top: 8,
                        left: 8,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border)),
                      ),
                    ]
                ),
              ),
            ),
          ),
        );
      },),
    );
  }
}



