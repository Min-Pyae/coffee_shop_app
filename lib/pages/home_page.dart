import 'package:coffee_shop_app/components/bottom_nav_bar.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // NAVIGATE BOTTOM BAR
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // PAGES
  final List<Widget> _pages = const [
    ShopPage(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}