import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class RiverpodCounter extends StatelessWidget {
  const RiverpodCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const ProviderScope(child: RiverpodCounterInner());
}

class RiverpodCounterInner extends ConsumerWidget {
  const RiverpodCounterInner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Riverpod"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Text(
              '${ref.watch(counterProvider.state).state}',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(counterProvider.notifier).update((state) => state + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
