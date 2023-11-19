import 'package:flutter/material.dart';
import 'package:flutter_setup/api/api_service.dart';
import 'package:flutter_setup/controller/user_controller.dart';
import 'package:flutter_setup/modal/user.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  ApiService apiService = Get.find();
  UserController userController = Get.find();
  void login() {
    apiService.login(phone.text, password.text).then((data) {
      userController.saveUser(data.customer);
    }).catchError((error) {});
  }

  void setUser(User user) {
    userController.saveUser(user);
  }
}
