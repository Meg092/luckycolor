import 'package:get/get.dart';
import 'lucky_colors_type_of_lucky_logic.dart';

class LuckyColorsTypeOfLuckyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LuckyColorsTypeOfLuckyController());
  }
}
