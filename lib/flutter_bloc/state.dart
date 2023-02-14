import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/shared/item.dart';

abstract class AppEvent {}

class AddMore extends AppEvent {}

class AddItem extends AppEvent {
  final Item item;
  AddItem(this.item);
}

class IncreaseItemCount extends AppEvent {
  final Item item;
  IncreaseItemCount(this.item);
}

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

class AppBloc extends Bloc<AppEvent, AppState> with ItemManager {
  AppBloc(List<Item> items)
      : super(
          AppState(
            items: items,
            total: items.fold(0, (p, c) => p + c.count),
          ),
        ) {
    on<AddMore>(_onAddMore);
    on<AddItem>(_onAddItem);
    on<IncreaseItemCount>(_onIncreaseItemCount);
  }

  @override
  void addItem([Item? item]) {
    final itemToAdd = item ?? Item(title: DateTime.now().toString());
    add(AddItem(itemToAdd));
  }

  @override
  void increaseCount(Item item) {
    add(IncreaseItemCount(item));
  }

  void _onAddMore(AddMore event, Emitter<AppState> emit) async {
    return addMore();
  }

  void _onAddItem(
    AddItem event,
    Emitter<AppState> emit,
  ) {
    state.items.add(event.item);

    emit(
      state.copyWith(
        total: state.total + event.item.count,
      ),
    );
  }

  void _onIncreaseItemCount(
    IncreaseItemCount event,
    Emitter<AppState> emit,
  ) {
    event.item.count++;
    emit(
      state.copyWith(
        total: state.total + 1,
      ),
    );
  }
}
