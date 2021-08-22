import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListModel extends ChangeNotifier {
  final List<WordPair> _items = [];

  UnmodifiableListView<WordPair> get items => UnmodifiableListView(_items);

  int get listSize => _items.length;

  void add(WordPair item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void removeItem(WordPair item) {
    _items.remove(item);
    notifyListeners();
  }
}
