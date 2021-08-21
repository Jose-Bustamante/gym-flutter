import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'timer_view',
      appBar: AppBar(
        title: const Text('Timer View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: const Text('Timer Click'),
        ),
      ),
    );
  }
}
