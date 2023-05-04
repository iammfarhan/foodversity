// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.categoryTitle,
    required this.categoryImage,
    required this.onTab,
  }) : super(key: key);
  final String categoryTitle;
  final String categoryImage;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 130,
        width: 110,
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
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(categoryImage),
                width: 60,
                height: 60,
              ),
              SizedBox(height: 10),
              Text(
                categoryTitle,
                style: context.primaryTextTheme.titleMedium!.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "10-15 min",
                style: context.primaryTextTheme.titleMedium!.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
