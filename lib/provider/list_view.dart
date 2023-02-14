import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managements/provider/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return ListViewShared(
          items: appState.items,
          onTap: (int index) {
            appState.increaseCount(appState.items[index]);
          },
        );
      },
    );
  }
}
