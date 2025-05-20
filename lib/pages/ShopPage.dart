import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanflex/components/ShoeTile.dart';
import 'package:urbanflex/models/cart.dart';
import 'package:urbanflex/models/shoe.dart';

class ShopPage extends StatefulWidget {
  final Function(int)? onTabChange;
  const ShopPage({super.key, this.onTabChange});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<String> banners = [
    'lib/images/promo-2.png',
    'lib/images/Promo-1.png',
    'lib/images/promo-3.png',
  ];

  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = '';

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % banners.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully Added"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final filteredShoes = value.getShoeList().where((shoe) {
          final name = shoe.name.toLowerCase();
          final desc = shoe.description.toLowerCase();
          return name.contains(_searchKeyword) || desc.contains(_searchKeyword);
        }).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchKeyword = value.toLowerCase();
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Search for shoes...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Image Slider
              SizedBox(
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Image.asset(
                          banners[index],
                          fit: BoxFit.contain,
                          height: 110,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Hot Picks Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hot Picks 🔥',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onTabChange?.call(2);
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Horizontal List of Shoes
              Expanded(
                child: filteredShoes.isEmpty
                    ? const Center(child: Text("No products found."))
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredShoes.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final shoe = filteredShoes[index];
                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
