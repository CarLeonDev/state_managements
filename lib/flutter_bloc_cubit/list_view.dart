import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/flutter_bloc_cubit/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return ListViewShared(
          items: appState.items,
          onTap: (int index) {
            context.read<AppCubit>().increaseCount(appState.items[index]);
          },
        );
      },
    );
  }
}
