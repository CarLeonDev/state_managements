import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/flutter_bloc/state.dart';
import 'package:state_managements/flutter_bloc/list_view.dart';
import 'package:state_managements/shared/app.dart';
import 'package:state_managements/shared/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(initialItems)..add(AddMore()),
      child: Builder(
        builder: (context) {
          return AppShared(
            title: 'flutter_bloc',
            body: const ListViewWidget(),
            total: BlocBuilder<AppBloc, AppState>(
              buildWhen: (previousState, state) {
                return previousState.total != state.total;
              },
              builder: (context, appState) {
                return CircleAvatar(
                  child: Text("${appState.total}"),
                );
              },
            ),
            onAdd: context.read<AppBloc>().addItem,
          );
        },
      ),
    );
  }
}
