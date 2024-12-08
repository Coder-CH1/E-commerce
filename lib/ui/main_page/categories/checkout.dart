import 'package:checkout_screen_ui/checkout_ui.dart';
import 'package:flutter/material.dart';
import '../../../custom_widgets/custom_widgets.dart';

///
class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final List<PriceItem> wearsBought = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout', textStyle: const TextStyle(color: redColor, fontSize: 22),
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: CustomText(
                text: 'Payment method',
                style: TextStyle(
                  color: redColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: CheckoutPage(data: CheckoutData(
              priceItems: wearsBought,
              payToName: '',
              onCardPay: (paymentInfo, checkoutResult) =>
              const Empty(),
            ),
              footer: const CheckoutPageFooter(
                termsLink: 'http://example.com/terms',
                privacyLink: 'http://example.com/privacy',
              ),
            ),
          ),
          const SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: CustomButton(
                  text: 'Place Order', buttonTextStyle: const TextStyle(color: whiteColor),
                  onPressed: () {
                    _showOrdersPlacedSuccessfully();
                  },color: redColor),
            ),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
  ///
  void _showOrdersPlacedSuccessfully() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Orders Placed Successfully'),
            content: const Text('You will receive an email alert confirmation'),
            actions: [
              CustomButton(
                onPressed: () {},
                text: 'See Order details',
                buttonTextStyle: const TextStyle(
                    color: whiteColor
                ),
                color: redColor,
              )
            ],
          );
        }
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
