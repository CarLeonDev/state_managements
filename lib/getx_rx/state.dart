import 'package:get/get.dart';
import 'package:state_managements/shared/item.dart';

class AppState extends GetxController with ItemManager {
  final RxList<Item> items;
  RxInt total = 0.obs;

  AppState(List<Item> items) : items = items.obs {
    total.value = items.fold(0, (acc, item) => acc + item.count);
  }

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());
    items.add(itemToAdd);
    total += itemToAdd.count;
  }

  @override
  void increaseCount(Item item) {
    item.count += 1;
    items.refresh();
    total.value += 1;
  }
}
