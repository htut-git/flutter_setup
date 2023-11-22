import 'package:flutter/material.dart';
import 'package:flutter_setup/api/api_service.dart';
import 'package:flutter_setup/data/modal/user.dart';
import 'package:flutter_setup/app/services/user_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  ApiService apiService = Get.find();
  UserService userService = Get.find();
  void login() {
    apiService.login(phone.text, password.text).then((data) {
      userService.saveUser(data.customer);
    }).catchError((error) {});
  }

  void setUser(User user) {
    userService.saveUser(user);
  }

  @override
  void onInit() {
    print('inint LoginController');
    super.onInit();
  }

  @override
  void onClose() {
    print('close');
    // TODO: implement onClose
    super.onClose();
  }
}
