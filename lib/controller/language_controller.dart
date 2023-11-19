import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    loadLocale();
    super.onInit();
  }

  Future<void> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String locale = prefs.getString('locale') ?? 'en_US';
    Get.updateLocale(Locale(locale));
  }

  Future<void> changeLanguage(Locale newLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', newLocale.toString());
    Get.updateLocale(newLocale);
  }
}
