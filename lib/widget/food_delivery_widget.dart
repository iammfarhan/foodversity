// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class FoodDeliveryWidget extends StatelessWidget {
  const FoodDeliveryWidget({
    Key? key,
    required this.onTab,
  }) : super(key: key);

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500.withOpacity(0.3),
                spreadRadius: 1.3,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Food",
                      textAlign: TextAlign.start,
                      style: context.primaryTextTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onPrimary,
                        letterSpacing: 1.15,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Order from your \nfavourite restaurants ",
                      textAlign: TextAlign.start,
                      style: context.primaryTextTheme.titleMedium!.copyWith(
                        color: context.colorScheme.onPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('assets/images/delivery.png'),
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
