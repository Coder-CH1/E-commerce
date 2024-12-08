import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';

/// TAB 3: FAVORITES
class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}
class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: lightBlue,
      ),
    );
  }
}