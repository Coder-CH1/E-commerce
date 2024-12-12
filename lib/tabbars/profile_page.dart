import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../registration_login/login.dart';


/// TAB 4: PROFILE
class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  User? _currentUser;
  final List<Map<String, dynamic>> listViewItems = [{
    'title': 'My Orders',
    'screen': const MyOrders(),},
    {
      'title': 'Payment Methods',
      'screen': const PaymentMethod(),},
    {
      'title': 'Settings',
      'screen': const Settings(),}

  ];
  @override
  void initState(){
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (!mounted) return;
      Navigator.pushReplacement(
          context,
      MaterialPageRoute(builder: (context) => const Login()),
      );
    } catch (e) {
      print('');
    }
  }
  @override
  Widget build(BuildContext context) {
    String userEmail = _currentUser?.email ?? 'No email available';
    return  Scaffold(
      appBar: CustomAppBar(title: 'Profile',
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
          Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.person_pin,
                  size: 80,
                  )
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomText(text: 'Email:', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomText(text: userEmail, style: const TextStyle()),
            ],
          )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 0),
                itemCount: listViewItems.length,
                itemBuilder: (context, index) {
                  final item = listViewItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        title: Text(item['title']),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) => item['screen'])
                        );
                      }
                    )
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomButton(
                text: 'Logout',buttonTextStyle: const TextStyle(color: whiteColor),
                onPressed: (){
                  _logout();
                },
                color: redColor,
            ),
          )
        ],
      )
    );
  }
}


class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
