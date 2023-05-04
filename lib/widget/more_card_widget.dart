// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class MoreCardWidget extends StatelessWidget {
  const MoreCardWidget({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTab,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
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
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 25,
                    color: context.colorScheme.error,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: context.primaryTextTheme.headlineSmall!.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 25,
                color: context.colorScheme.error,
              )
            ],
          ),
        ),
      ),
    );
  }
}
