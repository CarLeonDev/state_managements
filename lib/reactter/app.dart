import 'package:flutter/material.dart';
import 'package:flutter_reactter/flutter_reactter.dart';
import 'package:state_managements/reactter/list_view.dart';
import 'package:state_managements/shared/app.dart';
import 'package:state_managements/shared/item.dart';

import 'state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactterProvider<AppState>(
      () => AppState(initialItems)..addMore(),
      builder: (appState, _, __) {
        return AppShared(
          title: 'Reactter Sample',
          body: const ListViewWidget(),
          total: ReactterWatcher(
            builder: (_, __) {
              return CircleAvatar(
                child: Text("${appState.total}"),
              );
            },
          ),
          onAdd: appState.addItem,
        );
      },
    );
  }
}
