import 'package:flutter_setup/screens/home.dart';
import 'package:flutter_setup/screens/login.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static List<GetPage> getPages() {
    return [
      GetPage(name: '/', page: () => Home()),
      GetPage(name: '/login', page: () => Login()),
    ];
  }
}
