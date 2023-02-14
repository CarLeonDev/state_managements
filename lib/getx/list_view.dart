import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/getx/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends GetView<AppState> {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppState>(
      builder: (appState) {
        return ListViewShared(
          items: appState.items,
          onTap: (int index) => appState.increaseCount(appState.items[index]),
        );
      },
    );
  }
}
