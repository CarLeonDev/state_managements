import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/riverpod/list_view.dart';
import 'package:state_managements/riverpod/state.dart';
import 'package:state_managements/shared/app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (_, ref, __) {
          return AppShared(
            title: 'Riverpod',
            body: const ListViewWidget(),
            total: Consumer(
              builder: (_, ref, __) {
                ref.watch(appProvider.select((appState) => appState.total));

                return CircleAvatar(
                  child: Text("${ref.read(appProvider).total}"),
                );
              },
            ),
            onAdd: ref.read(appProvider).addItem,
          );
        },
      ),
    );
  }
}
