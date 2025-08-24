import 'package:get/get.dart';
import 'lucky_colors_init_logic.dart';
import 'package:flutter/material.dart';


class LuckyColorsInitView extends GetView<LuckyColorsInitLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.haag.value
              ? const CircularProgressIndicator(color: Colors.blue)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.vkmype();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
