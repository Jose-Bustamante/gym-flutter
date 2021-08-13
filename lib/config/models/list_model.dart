import 'dart:collection';
import 'package:flutter/material.dart';

class ListModel extends ChangeNotifier {
  final List<String> _items = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(_items);

  int get listSize => _items.length;

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
}
