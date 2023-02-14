import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/riverpod/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends ConsumerWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return ListViewShared(
      items: appState.items,
      onTap: (int index) => appState.increaseCount(appState.items[index]),
    );
  }
}
