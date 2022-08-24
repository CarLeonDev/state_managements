import 'package:flutter/material.dart';
import 'bloc_counter.dart';
import 'getx_counter.dart';
import 'mobx_counter.dart';
import 'provider_counter.dart';
import 'reactter_counter.dart';
import 'riverpod_counter.dart';
import 'set_state_counter.dart';

void main() {
  runApp(const MyApp());
}

Map<String, Widget Function()> stateManagements = {
  'Bloc': () => const BlocCounter(),
  'Getx': () => const GetxCounter(),
  'Mobx': () => const MobxCounter(),
  'Provider': () => const ProviderCounter(),
  'Reactter': () => const ReactterCounter(),
  'Riverpod': () => const RiverpodCounter(),
  'SetState': () => const SetStateCounter(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Managements counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter example with:"),
        ),
        body: ListView.builder(
          itemCount: stateManagements.length,
          itemBuilder: (BuildContext context, int index) {
            final title = stateManagements.keys.toList()[index];
            final build = stateManagements.values.toList()[index];

            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => build(),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(title),
            );
          },
        ),
      ),
    );
  }
}
