import 'package:flutter/material.dart';

class CartItem {
  final String name;
  late final double price;
  late final int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}


class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get total => _items.fold(
      0, (sum, item) => sum + (item.price * item.quantity));



void addToCart(CartItem item) {
  int index = _items.indexWhere((element) => element.name == item.name);
  if (index != -1) {
    _items[index].quantity++;
    _items[index].price = _items[index].price * _items[index].quantity;
  } else {
    _items.add(item);
  }
  notifyListeners();
}


  void removeFromCart(CartItem item) {
    int index = _items.indexWhere((element) => element.name == item.name);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

