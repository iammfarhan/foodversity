import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class ReferalScreen extends StatefulWidget {
  const ReferalScreen({Key? key}) : super(key: key);
  @override
  State<ReferalScreen> createState() => _ReferalScreenState();
}

class _ReferalScreenState extends State<ReferalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.colorScheme.background,
            size: 25,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: Text(
          "Referal",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage('assets/images/referal.png'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Invite friends, get Rs 100.00 off",
              textAlign: TextAlign.start,
              style: context.primaryTextTheme.headlineSmall!.copyWith(
                color: context.colorScheme.onPrimary,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "1. Your friends get Rs 100.00 ",
              textAlign: TextAlign.start,
              style: context.primaryTextTheme.headlineSmall!.copyWith(
                color: context.colorScheme.onPrimary,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "when they sign up with your invite link",
              style: context.primaryTextTheme.titleMedium!.copyWith(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "2. Then you get Rs 100.00 ",
              textAlign: TextAlign.start,
              style: context.primaryTextTheme.headlineSmall!.copyWith(
                color: context.colorScheme.onPrimary,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "once they place their first order (min. Rs.500.00)",
              style: context.primaryTextTheme.titleMedium!.copyWith(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    context.colorScheme.error,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: const Text(
                  "SHARE YOUR LINK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    context.colorScheme.background,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: context.colorScheme.error,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  "SCAN QR CODE",
                  style: TextStyle(
                    color: context.colorScheme.error,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
