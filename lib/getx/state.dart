import 'package:get/get.dart';
import 'package:state_managements/shared/item.dart';

class AppState extends GetxController with ItemManager {
  final List<Item> items;
  int _total = 0;
  int get total => _total;

  AppState(this.items) {
    _total = items.fold(0, (acc, item) => acc + item.count);
    update(['total']);
  }

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());
    items.add(itemToAdd);
    _total += itemToAdd.count;
    update(['total']);
  }

  @override
  void increaseCount(Item item) {
    item.count += 1;
    _total += 1;
    update(['total']);
  }
}
