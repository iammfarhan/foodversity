import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import 'package:foodversity/feat%20order%20food/widget/food_item.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Menu",
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
            Navigator.pushReplacementNamed(context, '/canteenscreen');
          },
        ),
        backgroundColor: context.colorScheme.error,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 30),
            FoodItem(
              name: "Zinger",
              image:
                  "https://images.unsplash.com/photo-1549611016-3a70d82b5040?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHppbmdlciUyMGJ1cmdlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
              price: 1000,
            ),
            SizedBox(height: 10),
            FoodItem(
              name: "Fries",
              image:
                  "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZnJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
              price: 300,
            ),
            SizedBox(height: 10),
            FoodItem(
              name: "Pizza",
              image:
                  "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              price: 850,
            ),
            SizedBox(height: 10),
            FoodItem(
              name: "Roll",
              image:
                  "https://images.unsplash.com/photo-1511421585906-57a6e6dc3a2f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJvbGx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
              price: 500,
            ),
            SizedBox(height: 10),
            FoodItem(
              name: "Juice",
              image:
                  "https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8anVpY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
              price: 450,
            ),
            SizedBox(height: 10),
            FoodItem(
              name: "Coffee",
              image:
                  "https://plus.unsplash.com/premium_photo-1675435644687-562e8042b9db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGNvZmZlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
              price: 250,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
