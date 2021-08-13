import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/timer/timer_view.dart';
import 'views/list/word_list_view.dart';
import 'views/home/home_view.dart';
import 'config/models/list_model.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListModel()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burn that Fat 2',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/timer': (context) => const TimerView(),
        '/list': (context) => const WordList(),
      },
    );
  }
}
