import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatelessWidget {
  const SavedList({Key? key, required this.saved}) : super(key: key);
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final List<WordPair> saved;

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
      ),
      body: ListView(children: divided),
    );
  }
}
