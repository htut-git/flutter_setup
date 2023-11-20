import 'package:flutter_setup/app/controller/language_controller.dart';
import 'package:flutter_setup/app/services/user_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserService>(() => UserService());
    Get.lazyPut<LanguageController>(() => LanguageController());
    Get.lazyPut<GetStorage>(() => GetStorage());
  }
}