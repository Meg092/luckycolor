import 'package:get/get.dart';

import 'lucky_colors_init_logic.dart';

class LuckyColorsInitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LuckyColorsInitLogic(),
      permanent: true,
    );
  }
}
