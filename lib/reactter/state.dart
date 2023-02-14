import 'package:flutter_reactter/flutter_reactter.dart';
import 'package:state_managements/shared/item.dart';

class AppState extends ReactterContext with ItemManager {
  final Signal<List<Item>> items;
  final total = 0.signal;

  AppState(List<Item> items) : items = items.signal {
    total.value = items.fold(0, (acc, item) => acc + item.count);
  }

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());
    items.add(itemToAdd);
    total.value += itemToAdd.count;
  }

  @override
  void increaseCount(Item item) {
    items.update((_) => item.count++);
    total.value++;
  }
}
