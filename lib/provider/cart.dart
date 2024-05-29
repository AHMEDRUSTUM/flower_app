import 'package:flower_app/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Item> selectproduct = [];
  add(Item porduct) {
    selectproduct.add(porduct);
    notifyListeners();
  }

  int List_length() {
    return selectproduct.length;
  }

  double fiyat() {
    double fiy = 0;
    selectproduct.forEach((element) {
      fiy += element.price.round();
    });
    return fiy;
  }

  void delete(int index) {
    selectproduct.removeAt(index);
    notifyListeners();
  }
}
