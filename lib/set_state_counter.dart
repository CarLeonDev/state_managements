import 'package:flutter/material.dart';

class SetStateCounter extends StatefulWidget {
  const SetStateCounter({Key? key}) : super(key: key);

  @override
  SetStateCounterState createState() => SetStateCounterState();
}

class SetStateCounterState extends State<SetStateCounter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with setState"),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
