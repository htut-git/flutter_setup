import 'package:flutter_setup/controller/language_controller.dart';
import 'package:flutter_setup/controller/user_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
