import 'package:get/get.dart';

import 'lucky_colors_home_logic.dart';

class LuckyColorsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LuckyColorsHomeController());
  }
}
