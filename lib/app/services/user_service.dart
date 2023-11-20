import 'package:flutter_setup/data/modal/user.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  Rx<User?> user = Rx<User?>(null);
  void saveUser(User saveUser) {
    user.value = saveUser;
  }
}
