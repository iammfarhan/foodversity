import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

import '../widget/bottom_nav_bar.dart';
import '../widget/canteen_categories_vertical_widget.dart';

class CanteenScreen extends StatefulWidget {
  const CanteenScreen({Key? key}) : super(key: key);

  @override
  State<CanteenScreen> createState() => _CanteenScreenState();
}

class _CanteenScreenState extends State<CanteenScreen> {
  @override
  Widget build(BuildContext context) {
    void onChangeNavigation(int index) {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/cartscreen');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/more');
      }
    }

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Canteens",
          style: context.primaryTextTheme.headlineMedium!.copyWith(
            color: context.colorScheme.background,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        backgroundColor: context.colorScheme.error,
        elevation: 1,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CanteenCategoriesVerticalWidget(
            categoryTitle: "Z Corner",
            categoryImage: 'assets/images/r1.png',
            onTab: () {
              Navigator.pushReplacementNamed(context, '/foodmenuscreen');
            },
          ),
          SizedBox(height: 12),
          CanteenCategoriesVerticalWidget(
            categoryTitle: "Roll Corner",
            categoryImage: 'assets/images/r2.png',
            onTab: () {
              Navigator.pushReplacementNamed(context, '/foodmenuscreen');
            },
          ),
          SizedBox(height: 12),
          CanteenCategoriesVerticalWidget(
            categoryTitle: "Junction",
            categoryImage: 'assets/images/r3.png',
            onTab: () {
              Navigator.pushReplacementNamed(context, '/foodmenuscreen');
            },
          ),
          SizedBox(height: 12),
          CanteenCategoriesVerticalWidget(
            categoryTitle: "Slush",
            categoryImage: 'assets/images/r4.png',
            onTab: () {
              Navigator.pushReplacementNamed(context, '/foodmenuscreen');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        index: 1,
      ),
    );
  }
}
