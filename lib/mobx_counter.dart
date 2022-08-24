import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'mobx_counter.g.dart';

abstract class CounterAbstract with Store {
  @observable
  int count = 0;

  @action
  void increment() => count++;
}

class Counter = CounterAbstract with _$Counter;

final counter = Counter();

class MobxCounter extends StatelessWidget {
  const MobxCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Mobx"),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
