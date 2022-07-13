import 'package:flutter/material.dart';
import 'package:flutter_reactter/flutter_reactter.dart';

class CounterContext extends ReactterContext {
  late final counter = UseState(0, this);
  void increment() => counter.value++;
}

class ReactterCounter extends ReactterComponent<CounterContext> {
  const ReactterCounter({Key? key}) : super(key: key);

  @override
  get builder => () => CounterContext();

  @override
  Widget render(CounterContext ctx, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Reactter"),
      ),
      body: Center(
        child: Text(
          '${ctx.counter.value}',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ctx.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
