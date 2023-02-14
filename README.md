# Benchmarks of different State Management

This is a simple benchmark for several state managements in flutter. The benchmark is a application that load items as a list. With this we try to measure the lines of code, memory consumed and size of the app.

## Lines Number

The line numbers of the three files(`app.dart`, `list_view.dart`, `state.dart`) are added together.

![Lines number graph](/assets/lines_number_graph.png)

## Memory Size

Memory consumption is measured by performing 10 times an initial load of 1,000, 10,000 and 100,000 items, using the flutter development tools.

![Memory size graph](/assets/memory_size_graph.png)

## APP Size

The size measurement of the application is obtained from the apk build for android arm64 (with command `flutter build apk --analyze-size --target-platform android-arm64`), and then compared the one against the other state management, using the flutter developer tool.

![App size graph](/assets/app_size_graph.png)

## Contibute

You can contribute with:

- Pull requests to add other state management.
- Pull requests to improve the code.
- Report bugs.
- Report an unclear error.
- Report unclear documentation.

Any idea is welcome!

## TO-DO

- Measure performance in ops/s (operations per second).
- Write a contribute documentation.
- Keep package versions up to date.
- Add others state management.
