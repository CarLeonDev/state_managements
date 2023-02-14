import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/getx_rx/list_view.dart';
import 'package:state_managements/getx_rx/state.dart';
import 'package:state_managements/shared/app.dart';
import 'package:state_managements/shared/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Get.put<AppState>(AppState(initialItems)..addMore());

    return AppShared(
      title: 'Getx with Rx',
      body: const ListViewWidget(),
      total: Obx(
        () {
          return CircleAvatar(
            child: Text("${appState.total}"),
          );
        },
      ),
      onAdd: appState.addItem,
    );
  }
}
