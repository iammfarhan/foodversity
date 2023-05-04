// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class ReferWidget extends StatelessWidget {
  const ReferWidget({
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
            color: context.colorScheme.onError,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Refer a Friend",
                  textAlign: TextAlign.start,
                  style: context.primaryTextTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.background,
                    letterSpacing: 1.15,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "and both get a discount",
                  style: context.primaryTextTheme.titleMedium!.copyWith(
                    color: context.colorScheme.background,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
