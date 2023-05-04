import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import '../core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Routes()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFD2001A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 180,
                width: 180,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Foodversity",
                  textAlign: TextAlign.center,
                  style: context.primaryTextTheme.headline4!.copyWith(
                    color: context.colorScheme.background,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.25,
                    fontSize: 46
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
