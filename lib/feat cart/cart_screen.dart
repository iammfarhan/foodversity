import 'package:flutter/material.dart';
import 'package:foodversity/core/extension/context_extension.dart';
import 'package:provider/provider.dart';
import '../widget/bottom_nav_bar.dart';
import 'widget/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String paymentMode = 'Cash on Delivery';

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    void onChangeNavigation(int index) {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/canteenscreen');
      } else if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/more');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: context.primaryTextTheme.headlineMedium!.copyWith(
            color: context.colorScheme.background,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        backgroundColor: context.colorScheme.error,
        elevation: 1,
        centerTitle: true,
      ),
      body: Column(
        children: [
          cartProvider.items.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/cart.png'),
                        width: 55,
                        height: 55,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Items In Cart',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              color: Colors.red,
                              onPressed: () =>
                                  cartProvider.removeFromCart(item),
                              icon: const Icon(Icons.remove),
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              color: Colors.red,
                              onPressed: () => cartProvider.addToCart(item),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
          const Divider(),
          cartProvider.items.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Total: \$${cartProvider.total.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Payment Mode',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        RadioListTile(
                          title: const Text(
                            'Cash on Delivery',
                            style: TextStyle(fontSize: 15),
                          ),
                          value: 'Cash on Delivery',
                          groupValue: paymentMode,
                          onChanged: (value) {
                            setState(() {
                              paymentMode = value as String;
                            });
                          },
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: 'Delivery Address',
                            hintText: 'Enter delivery address',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: context.colorScheme.primary,
                            ),
                            hintStyle: TextStyle(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your delivery address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Place order functionality here
                                cartProvider.clearCart();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          context.colorScheme.error,
                                      title: Text(
                                        "Order Placed!",
                                        style: context
                                            .primaryTextTheme.titleMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: context.colorScheme.background,
                                        ),
                                      ),
                                      content: Text(
                                        "Your order is placed, Thank You!",
                                        style: context
                                            .primaryTextTheme.titleMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: context.colorScheme.background,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            "Close",
                                            style: context
                                                .primaryTextTheme.titleMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: context
                                                  .colorScheme.background,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              'Place Order',
                              style: TextStyle(
                                  color: context.colorScheme.background,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        index: 2,
      ),
    );
  }
}
