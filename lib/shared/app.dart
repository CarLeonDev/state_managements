import 'package:flutter/material.dart';

class AppShared extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget total;
  final VoidCallback onAdd;

  const AppShared({
    Key? key,
    required this.title,
    required this.body,
    required this.total,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(
        title: title,
        body: body,
        total: total,
        onAddButtonPressed: onAdd,
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget total;
  final VoidCallback onAddButtonPressed;

  const Page({
    Key? key,
    required this.title,
    required this.body,
    required this.total,
    required this.onAddButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [total],
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: onAddButtonPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
