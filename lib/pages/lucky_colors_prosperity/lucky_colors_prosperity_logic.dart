import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lucky_colors/db_lucky_colors/db_lucky_colors.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_entity.dart';

class LuckyColorsProsperityController extends GetxController {
  final DB db = Get.find<DB>();

  final selectedDay = Get.arguments['selectedDay'] as String?;
  final selectedLuckType = Get.arguments['selectedLuckType'] as String?;

  final icon = 'assets/prosperity.png'.obs;

  final RxList<LuckyColorsEntity> luckyColorsList = <LuckyColorsEntity>[].obs;

  @override
  void onInit() async {
    super.onInit();
    if (selectedDay == null || selectedLuckType == null) {
      Get.back();
    }

    if (selectedLuckType == 'Prosperity') {
      icon.value = 'assets/prosperity.png';
    } else if (selectedLuckType == 'Wealth') {
      icon.value = 'assets/wealth.png';
    } else if (selectedLuckType == 'Fortune') {
      icon.value = 'assets/fortune.png';
    }

    if (selectedDay == weekDays[7]) {
      luckyColorsList.value = await db.getColorsForTable(selectedLuckType!);
    } else {
      luckyColorsList.value = await db.getColorsForTableByDay(
        selectedLuckType!,
        selectedDay!,
      );
    }
  }

  clearAllRecords(BuildContext context) async {}
}
