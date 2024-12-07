import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_widgets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart', textStyle: const TextStyle(color: redColor, fontSize: 22),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const
            Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomTextButton(
                  text: 'Remove All',
                  onPressed: (){}
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridTile(
                        child: SizedBox(
                          height: 100,
                          width: 300,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: lightGray,
                            ),
                          ),
                        )
                    ),
                  );
                }
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 45,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomButton(
                text: 'Checkout', buttonTextStyle: const TextStyle(color: whiteColor),
                onPressed: () {},color: redColor),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

