import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lucky_colors/db_lucky_colors/db_lucky_colors.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_entity.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_util.dart';
import 'lucky_colors_day_selection_dialog.dart';

class LuckyColorsTypeOfLuckyController extends GetxController {
  final DB db = Get.find<DB>();

  final selectedDay = ''.obs;
  final selectedLuckType = 'Prosperity'.obs;

  @override
  void onInit() async {
    super.onInit();
    DateTime now = DateTime.now();
    int weekdayIndex = now.weekday % 7;
    selectedDay.value = weekDays[weekdayIndex];

    await db.autoUpdateAllTables();
  }

  void showDaySelectionDialog() {
    Get.dialog(
      DaySelectionDialog(
        weekDays: weekDays,
        initialSelectedDay: selectedDay.value,
        onConfirm: onDialogSelectPressed,
      ),
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
    );
  }

  onDialogSelectPressed(String day) {
    selectedDay.value = day;
    successToast('Selected: $day');
  }

  chooseTypeOfLucky(int index) {
    switch (index) {
      case 0:
        selectedLuckType.value = 'Prosperity';
        break;
      case 1:
        selectedLuckType.value = 'Wealth';
        break;
      case 2:
        selectedLuckType.value = 'Fortune';
        break;
    }
  }

  onTypeofLuckySelectPressed() {
    Get.toNamed(
      '/luckyColorsProsperity',
      arguments: {
        'selectedDay': selectedDay.value,
        'selectedLuckType': selectedLuckType.value,
      },
    );
  }
}
