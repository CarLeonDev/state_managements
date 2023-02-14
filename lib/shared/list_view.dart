import 'package:flutter/material.dart';
import 'package:state_managements/main.dart';
import 'package:state_managements/shared/item.dart';

class ListViewShared extends StatelessWidget {
  const ListViewShared({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  final List<Item> items;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    if (items.length == ADD_MORE_COUNT + INITIAL_COUNT && stopwatch.isRunning) {
      Future.microtask(() {
        print("Render end ${stopwatch.elapsed}");
        stopwatch.stop();
      });
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      itemCount: items.length,
      itemExtent: 50,
      itemBuilder: (context, index) => ListTile(
        key: Key("$index"),
        title: Text(items[index].title),
        trailing: Text(items[index].count.toString()),
        onTap: () => onTap?.call(index),
      ),
    );
  }
}
