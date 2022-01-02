import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'saved_list_view.dart';
import '../../config/models/list_model.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'word_list_view',
      appBar: AppBar(
        title: const Text('List View'),
        actions: [
          IconButton(
              icon: Icon(Icons.line_style_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consumer<ListModel>(
                      builder: (context, cart, child) {
                        return SavedList(
                            saved: cart.savedItems, removeAll: cart.removeAll);
                      },
                    ),
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return Consumer<ListModel>(builder: (context, list, child) {
      list.initList();
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: list.listSize * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();

            final index = i ~/ 2;

            return _buildRow(list.items[index]);
          });
    });
  }

  Widget _buildRow(WordPair pair) {
    return Consumer<ListModel>(builder: (context, list, child) {
      final alreadySaved = list.savedItems.contains(pair);

      return ListTile(
        title: Text(
          pair.asString,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border_outlined,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              list.removeItem(pair);
            } else {
              list.add(pair);
            }
          });
        },
      );
    });
  }
}
