import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product_data.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorite = [];
  List<Product> get favorite => _favorite;

  //function
  void isFavorite(Product all) {
    if (_favorite.contains(all)) {
      favorite.remove(all);
    } else {
      _favorite.add(all);
    }
    notifyListeners();
  }

  bool isExist(Product all) {
    final isExist = favorite.contains(all);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
