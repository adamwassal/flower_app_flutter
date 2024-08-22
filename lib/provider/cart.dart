import 'package:flower_app/models/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  // create new properties & methods
  List selectedproducts = [];

  double price = 0;
  add(Item product) {
    selectedproducts.add(product);
    price += product.price;
    notifyListeners();
  }

  delete(Item product) {
    selectedproducts.remove(product);
    price -= product.price;
    notifyListeners();
  }

}
