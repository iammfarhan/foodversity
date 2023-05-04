import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import 'package:provider/provider.dart';
import '../../feat cart/widget/cart_model.dart';

class FoodItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const FoodItem({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Padding(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      width: 90,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: context.primaryTextTheme.titleMedium!.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          price.toString(),
                          style: context.primaryTextTheme.titleMedium!.copyWith(
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
              ElevatedButton(
                onPressed: () {
                  cart.addToCart(CartItem(name: name, price: price));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 4), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        backgroundColor: context.colorScheme.error,
                        content: Text(
                          "Item added to cart!",
                          style: context.primaryTextTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.background,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: context.colorScheme.background),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
