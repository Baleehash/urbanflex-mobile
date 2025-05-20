import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanflex/models/cart.dart';
import 'package:urbanflex/pages/SplashPage.dart';
import 'package:urbanflex/pages/HomePage.dart';
import 'package:urbanflex/pages/ShopPage.dart';
import 'package:urbanflex/pages/CartPage.dart';
import 'package:urbanflex/pages/ProductsPage.dart';
import 'package:urbanflex/pages/ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/shop': (context) => const ShopPage(),
          '/cart': (context) => const CartPage(),
          '/products': (context) => const ProductsPage(),
          '/profile': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
