import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanflex/components/ShoeGridTile.dart';
import 'package:urbanflex/models/cart.dart';
import 'package:urbanflex/models/shoe.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  void addShoeToCart(BuildContext context, Shoe shoe) {
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
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: value.getShoeList().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final shoe = value.getShoeList()[index];
                  return ShoeGridTile(
                    shoe: shoe,
                    onTapAdd: () => addShoeToCart(context, shoe),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
