import 'package:get/get.dart';
import './lucky_colors_setting_logic.dart';

class LuckyColorsSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LuckyColorsSettingController());
  }
}
