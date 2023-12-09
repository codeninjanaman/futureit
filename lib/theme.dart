import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();
  RxBool _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  void toggleTheme() {
    _isDarkMode.toggle();
  }
}
