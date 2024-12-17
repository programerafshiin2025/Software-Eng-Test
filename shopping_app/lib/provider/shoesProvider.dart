import 'package:flutter/material.dart';
import 'package:shopping_app/data/globalvariable.dart';

class shoesprovider extends ChangeNotifier {
  List<Product> cartList = [];

  void addCart(Product item) {
    cartList.add(item);
    notifyListeners();
  }

  void RemoveCart(Product item) {
    cartList.remove(item);
    notifyListeners();
  }
}
