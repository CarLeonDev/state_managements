import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/getx_rx/state.dart';
import 'package:state_managements/shared/list_view.dart';

class ListViewWidget extends GetView<AppState> {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListViewShared(
          items: controller.items.value,
          onTap: (int index) {
            controller.increaseCount(controller.items[index]);
          },
        );
      },
    );
  }
}
