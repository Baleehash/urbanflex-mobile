import 'package:flutter/material.dart';
import 'package:urbanflex/pages/SplashPage.dart';


class AppDrawer extends StatelessWidget {
  final Function(int) onSelectTab;

  const AppDrawer({super.key, required this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 2, 81, 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),

              // Logo + Welcome
                Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "lib/images/noodle3.jpg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Welcome, Iqbal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.grey[200]),
              ),

              _DrawerItem(
                icon: Icons.home_rounded,
                title: "Shop",
                onTap: () => onSelectTab(0),
              ),
              _DrawerItem(
                icon: Icons.shopping_bag_rounded,
                title: "Cart",
                onTap: () => onSelectTab(1),
              ),
              _DrawerItem(
                icon: Icons.widgets_outlined,
                title: "Products",
                onTap: () => onSelectTab(2),
              ),
              _DrawerItem(
                icon: Icons.person_outline,
                title: "Profile",
                onTap: () => onSelectTab(3),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _DrawerItem(
              icon: Icons.logout_rounded,
              title: "Logout",
              isDanger: true,
              onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SplashPage()),
                (route) => false,
              );
             },
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDanger;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 2, 81, 9),
            ),
            child: Row(
              children: [
                Icon(icon, color: isDanger ? Colors.red[300] : Colors.white),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: isDanger ? Colors.red[300] : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
