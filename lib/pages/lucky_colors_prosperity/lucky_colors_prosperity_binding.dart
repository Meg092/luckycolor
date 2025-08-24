import 'package:get/get.dart';
import 'lucky_colors_prosperity_logic.dart';

class LuckyColorsProsperityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LuckyColorsProsperityController());
  }
}
