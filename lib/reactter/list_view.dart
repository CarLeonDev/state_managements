import 'package:flutter/material.dart';
import 'package:flutter_reactter/flutter_reactter.dart';
import 'package:state_managements/reactter/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>((ctx) => [ctx.items]);

    return ListViewShared(
      items: appState.items.value,
      onTap: (int index) => appState.increaseCount(appState.items[index]),
    );
  }
}
