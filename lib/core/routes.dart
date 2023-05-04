import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodversity/feat%20cart/cart_screen.dart';
import 'package:foodversity/feat%20order%20food/canteen_screen.dart';
import 'package:foodversity/feat%20order%20food/food_menu.dart';
import 'package:foodversity/feat%20refer/referal_screen.dart';
import '../auth screens/login_screen.dart';
import '../auth screens/reset_screen.dart';
import '../auth screens/signup_screen.dart';
import '../feat more/more_screen.dart';
import '../home_screen.dart';
import 'constant/theme.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  bool _initialized = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();

    initializeFlutterFire();
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemePreferencesImpl().dark,
      themeMode: ThemeMode.dark,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/more': (context) => const MoreScreen(),
        '/canteenscreen': (context) => const CanteenScreen(),
        '/cartscreen': (context) => const CartScreen(),
        '/foodmenuscreen': (context) => const FoodMenuScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset': (context) => const ResetScreen(),
        '/referal': (context) => const ReferalScreen(),
      },
    );
  }
}
