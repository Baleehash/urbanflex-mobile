import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanflex/components/CartItem.dart';
import 'package:urbanflex/models/cart.dart';
import 'package:urbanflex/models/shoe.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void checkoutToWhatsApp(BuildContext context, Cart cart) async {
    final List<Shoe> cartItems = cart.getUserCart();
    if (cartItems.isEmpty) return;

    final String phone = '6281321896707';
    final StringBuffer messageBuffer = StringBuffer("Hello! I want to order:\n");

    for (var item in cartItems) {
      messageBuffer.writeln("- ${item.name} (\$${item.price})");
    }

    messageBuffer.writeln("\nTotal: \$${cart.calculateTotal().toStringAsFixed(2)}");

    final String url = 'https://wa.me/$phone?text=${Uri.encodeComponent(messageBuffer.toString())}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tidak dapat membuka WhatsApp")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        final items = cart.getUserCart();

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text("My Cart"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: items.isEmpty
                      ? const Center(
                          child: Text("Your cart is empty.", style: TextStyle(fontSize: 16)),
                        )
                      : ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final shoe = items[index];
                            return CartItem(shoe: shoe);
                          },
                        ),
                ),
                const SizedBox(height: 20),
                if (items.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(
                              "\$${cart.calculateTotal().toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => checkoutToWhatsApp(context, cart),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: const Color.fromARGB(255, 2, 81, 9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Checkout via WhatsApp",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
