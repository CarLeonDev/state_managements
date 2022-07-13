import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class ProviderCounter extends StatelessWidget {
  const ProviderCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: Builder(builder: (context) {
        final counterModel = Provider.of<Counter>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Counter with Provider"),
          ),
          body: Center(
            child: Text(
              '${counterModel.getCounter()}',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: counterModel.increment,
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
