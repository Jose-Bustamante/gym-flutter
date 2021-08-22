import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatelessWidget {
  const SavedList({Key? key, required this.saved, required this.removeAll})
      : super(key: key);
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final List<WordPair> saved;
  final VoidCallback removeAll;

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(context: context, tiles: tiles).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
        actions: [
          IconButton(
              onPressed: removeAll, icon: Icon(Icons.delete_forever_rounded))
        ],
      ),
      body: ListView(children: divided),
    );
  }
}
