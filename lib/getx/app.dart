import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/getx/state.dart';
import 'package:state_managements/getx/list_view.dart';
import 'package:state_managements/shared/app.dart';
import 'package:state_managements/shared/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppState>(
      init: AppState(initialItems)..addMore(),
      builder: (appState) {
        return AppShared(
          title: 'Getx',
          body: const ListViewWidget(),
          total: GetBuilder<AppState>(
            id: 'total',
            builder: (appState) {
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
