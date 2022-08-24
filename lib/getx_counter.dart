import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  var count = 0.obs;
}

class GetxCounter extends StatelessWidget {
  const GetxCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Getx"),
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${counter.count.value}',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.count++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
