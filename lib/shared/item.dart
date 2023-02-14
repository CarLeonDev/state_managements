// ignore_for_file: constant_identifier_names
import 'package:state_managements/main.dart';

const INITIAL_COUNT = 3;
const ADD_MORE_COUNT = 1000000;
const ADD_MORE_ASYNC_COUNT = 10;

class Item {
  final String title;
  int count;

  Item({
    required this.title,
    this.count = 0,
  });

  Item copyWith({String? title, int? count}) {
    return Item(
      title: title ?? this.title,
      count: count ?? this.count,
    );
  }
}

final List<Item> initialItems = List.generate(
  INITIAL_COUNT,
  (index) => Item(title: 'Item 1', count: index + 1),
);

mixin ItemManager {
  void addMore() {
    print('addMore start - ${stopwatch.elapsed}');

    for (int i = 0; i < ADD_MORE_COUNT; i++) {
      addItem(Item(title: DateTime.now().toString(), count: 1));
    }

    print('addMore end - ${stopwatch.elapsed}');

    // print('init to add more async!!');
    // for (int i = 0; i < ADD_MORE_ASYNC; i++) {
    //   await Future.delayed(
    //     const Duration(milliseconds: 500),
    //     () => addItem(
    //       Item(title: DateTime.now().toString(), count: i + 1),
    //     ),
    //   );
    // }
    // print('end to add more async!!');
  }

  void addItem([Item? item]);

  void increaseCount(Item item);
}
