import 'package:flutter/material.dart';

class ColorsSizeNotifier with ChangeNotifier {
  String _sizes = '';
   get sizes => _sizes;
  void setSizes(String s) {
    if (_sizes == s) {
      _sizes = '';
    } else {
      _sizes = s;
    }
    notifyListeners();
  }

   String _color = '';
   get color => _color;
  void setColor(String c) {
    if (_color == c) {
      _color = '';
    } else {
      _color = c;
    }
    notifyListeners();
  }
}
