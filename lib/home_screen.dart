import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

import 'widget/bottom_nav_bar.dart';
import 'widget/carousal_widget.dart';
import 'widget/cart.dart';
import 'widget/categories_widget.dart';
import 'widget/food_delivery_widget.dart';
import 'widget/refer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void onChangeNavigation(int index) {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/canteenscreen');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/cartscreen');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/more');
      }
    }

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              CartWidget(
                onTab: () {
                  Navigator.pushReplacementNamed(context, '/cartscreen');
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Welcome back!",
                  style: context.primaryTextTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Let's order the best food \naround you in university",
                  textAlign: TextAlign.start,
                  style: context.primaryTextTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.onPrimary,
                    letterSpacing: 1,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CarouselSliderWidget(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Popular Canteens",
                  textAlign: TextAlign.start,
                  style: context.primaryTextTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.onPrimary,
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 136,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 8);
                    },
                    shrinkWrap: true,
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          CategoriesWidget(
                            categoryTitle: "Z Corner",
                            categoryImage: 'assets/images/r1.png',
                            onTab: () {},
                          ),
                          SizedBox(width: 10),
                          CategoriesWidget(
                            categoryTitle: "Roll Corner",
                            categoryImage: 'assets/images/r2.png',
                            onTab: () {},
                          ),
                          SizedBox(width: 8),
                          CategoriesWidget(
                            categoryTitle: "Junction",
                            categoryImage: 'assets/images/r3.png',
                            onTab: () {},
                          ),
                          SizedBox(width: 8),
                          CategoriesWidget(
                            categoryTitle: "Slush",
                            categoryImage: 'assets/images/r4.png',
                            onTab: () {},
                          ),
                          SizedBox(width: 8),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FoodDeliveryWidget(
                onTab: () {
                  Navigator.pushReplacementNamed(context, '/canteenscreen');
                },
              ),
              const SizedBox(height: 30),
              ReferWidget(
                onTab: () {
                  Navigator.pushReplacementNamed(context, '/referal');
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        index: 0,
      ),
    );
  }
}
