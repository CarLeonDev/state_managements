import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class RiverpodCounter extends StatelessWidget {
  const RiverpodCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: RiverpodCounterInner());
  }
}

class RiverpodCounterInner extends ConsumerWidget {
  const RiverpodCounterInner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(counterProvider);

    void increment() => ref.read(counterProvider.state).state++;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Riverpod"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(counterProvider.state).state;

            return Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
