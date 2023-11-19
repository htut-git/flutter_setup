import 'package:flutter_setup/modal/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  void saveUser(User saveUser) {
    user.value = saveUser;
  }
}
