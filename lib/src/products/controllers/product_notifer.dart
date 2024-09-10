import 'package:fashion_app/src/products/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductNotifer with ChangeNotifier {
  Products? product;
  void setProduct(Products p) {
    product = p;
    notifyListeners();
  }

  bool _description = false;
   get description => _description;
  void setDescription() {
    _description = !_description;
    notifyListeners();
  }
}
