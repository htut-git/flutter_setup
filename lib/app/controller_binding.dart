import 'package:flutter_setup/controller/language_controller.dart';
import 'package:flutter_setup/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<LanguageController>(() => LanguageController());
    Get.lazyPut<GetStorage>(() => GetStorage());
  }
}
