import 'package:flutter/material.dart';
// import 'package:state_managements/flutter_bloc/app.dart';
// import 'package:state_managements/flutter_bloc_cubit/app.dart';
// import 'package:state_managements/getx/app.dart';
// import 'package:state_managements/getx_rx/app.dart';
// import 'package:state_managements/provider/app.dart';
import 'package:state_managements/reactter/app.dart';
// import 'package:state_managements/riverpod/app.dart';

final stopwatch = Stopwatch()..start();

void main() {
  print("Render start - ${stopwatch.elapsed}");
  runApp(const App());
}
