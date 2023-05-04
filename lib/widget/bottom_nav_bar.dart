import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.onChange,
    this.index,
  }) : super(key: key);
  final Function(int) onChange;
  final index;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: context.colorScheme.error,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          gap: 5,
          activeColor: Colors.white,
          iconSize: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          duration: const Duration(milliseconds: 800),
          tabBackgroundColor: context.colorScheme.error,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.local_dining,
              text: 'Order',
            ),
            GButton(
              icon: Icons.local_grocery_store,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.dehaze,
              text: 'Logout',
            ),
          ],
          selectedIndex: widget.index,
          onTabChange: widget.onChange,
        ),
      ),
    );
  }
}
