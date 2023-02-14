import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managements/provider/list_view.dart';
import 'package:state_managements/provider/state.dart';
import 'package:state_managements/shared/app.dart';
import 'package:state_managements/shared/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(initialItems)..addMore(),
      child: Builder(
        builder: (context) {
          final appState = context.read<AppState>();

          return AppShared(
            title: 'Provider Sample',
            body: const ListViewWidget(),
            total: Selector<AppState, int>(
              selector: (_, appState) => appState.total,
              builder: (_, total, __) {
                return CircleAvatar(
                  child: Text("$total"),
                );
              },
            ),
            onAdd: () => appState.addItem(),
          );
        },
      ),
    );
  }
}
