// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class CanteenCategoriesVerticalWidget extends StatelessWidget {
  const CanteenCategoriesVerticalWidget({
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
    return 
    GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 100,
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
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(categoryImage),
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryTitle,
                            style:
                                context.primaryTextTheme.titleMedium!.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "10-15 min",
                            style:
                                context.primaryTextTheme.titleMedium!.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: context.colorScheme.error,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
