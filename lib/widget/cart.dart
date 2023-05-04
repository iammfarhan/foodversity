// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400.withOpacity(0.10),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage('assets/images/cart.png'),
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
