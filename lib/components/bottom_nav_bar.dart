import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNav({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.all(24),
        color: Colors.grey.shade600,
        activeColor: Colors.grey.shade900,
        tabActiveBorder: Border.all(color: Colors.grey.shade300),
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}