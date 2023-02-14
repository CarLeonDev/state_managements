import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/shared/item.dart';

class AppState extends Equatable {
  final List<Item> items;
  final int total;

  const AppState({
    required this.items,
    this.total = 0,
  });

  AppState copyWith({
    List<Item>? items,
    int? total,
  }) {
    return AppState(
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [items, total];
}

class AppCubit extends Cubit<AppState> with ItemManager {
  AppCubit(List<Item> items)
      : super(
          AppState(
            items: items,
            total: items.fold(0, (p, c) => p + c.count),
          ),
        );

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());

    state.items.add(itemToAdd);

    emit(
      state.copyWith(
        total: state.total + itemToAdd.count,
      ),
    );
  }

  @override
  void increaseCount(Item item) async {
    item.count++;

    emit(
      state.copyWith(
        total: state.total + 1,
      ),
    );
  }
}
