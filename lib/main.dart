import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodversity/auth%20screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'core/constant/theme.dart';
import 'feat cart/widget/cart_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemePreferencesImpl().dark,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
