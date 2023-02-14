import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/shared/item.dart';

class AppState with ChangeNotifier, ItemManager {
  final List<Item> items;
  int total = 0;

  AppState(this.items) {
    total = items.fold(0, (acc, item) => acc + item.count);
    notifyListeners();
  }

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());
    items.add(itemToAdd);
    total += itemToAdd.count;
    notifyListeners();
  }

  @override
  void increaseCount(Item item) {
    item.count += 1;
    total += 1;
    notifyListeners();
  }
}

final appProvider = ChangeNotifierProvider<AppState>((ref) {
  return AppState(initialItems)..addMore();
});
