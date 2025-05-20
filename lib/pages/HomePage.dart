import 'package:flutter/material.dart';
import 'package:urbanflex/navigators/BottomNavbar.dart';
import 'package:urbanflex/navigators/AppDrawer.dart';
import 'package:urbanflex/pages/ShopPage.dart';
import 'package:urbanflex/pages/CartPage.dart';
import 'package:urbanflex/pages/ProductsPage.dart';
import 'package:urbanflex/pages/ProfilePage.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;
  late List<Widget> pagesList;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    // Inisialisasi pages dengan callback khusus untuk ShopPage
    pagesList = [
      ShopPage(onTabChange: navigateBottomBar),
      const CartPage(),
      const ProductsPage(),
      const ProfilePage(),
    ];
  }

  void navigateBottomBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: _selectedIndex,
        onTabChange: navigateBottomBar,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: AppDrawer(onSelectTab: (index) {
        setState(() {
          _selectedIndex = index;
          Navigator.pop(context);
        });
      }),
      body: pagesList[_selectedIndex],
    );
  }
}
