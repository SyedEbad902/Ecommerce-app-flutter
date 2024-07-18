import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product_data.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  //function
  void isFavorite(Product all) {
    if (_cart.contains(all)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(all);
    }
    notifyListeners();
  }

  incrementQty(int index) => _cart[index].quantity++;
  decrementQty(int index) => _cart[index].quantity--;

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
