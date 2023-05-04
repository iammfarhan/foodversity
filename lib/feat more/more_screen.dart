import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import '../widget/bottom_nav_bar.dart';
import '../widget/more_card_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onChangeNavigation(int index) {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/canteenscreen');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/cartscreen');
      } else if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Logout",
          style: context.primaryTextTheme.headlineMedium!.copyWith(
            color: context.colorScheme.background,
            fontSize: 20,
          ),
        ),
        backgroundColor: context.colorScheme.error,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            MoreCardWidget(
              title: "Logout",
              iconData: Icons.lock,
              onTab: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        index: 3,
      ),
    );
  }
}
