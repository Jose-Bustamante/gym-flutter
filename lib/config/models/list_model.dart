import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListModel extends ChangeNotifier {
  final List<WordPair> _items = [];
  final List<WordPair> _savedItems = [];

  UnmodifiableListView<WordPair> get items => UnmodifiableListView(_items);
  UnmodifiableListView<WordPair> get savedItems =>
      UnmodifiableListView(_savedItems);

  int get listSize => _items.length;
  int get savedListSize => _savedItems.length;

  void initList() {
    _items.addAll(generateWordPairs().take(10));
  }

  void add(WordPair item) {
    _savedItems.add(item);
    notifyListeners();
  }

  void removeAll() {
    _savedItems.clear();
    notifyListeners();
  }

  void removeItem(WordPair item) {
    _savedItems.remove(item);
    notifyListeners();
  }
}
