import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:urbanflex/pages/CartPage.dart';
import 'package:urbanflex/pages/ShopPage.dart';
import 'package:urbanflex/pages/ProductsPage.dart';
import 'package:urbanflex/pages/ProfilePage.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  final int currentIndex;

  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GNav(
        selectedIndex: currentIndex,
        onTabChange: onTabChange,
        gap: 8,
        backgroundColor: Colors.transparent,
        color: Colors.grey[500],
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 2, 81, 9),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        tabBorderRadius: 16,
        tabs: const [
          GButton(icon: Icons.home_rounded, text: 'Shop'),
          GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          GButton(icon: Icons.widgets_outlined, text: 'Products'),
          GButton(icon: Icons.person_outline, text: 'Profile'),
        ],
      ),
    );
  }
}
