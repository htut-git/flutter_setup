import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final GetStorage _storage = Get.find();

  @override
  void onInit() {
    loadLocale();
    super.onInit();
  }


  void loadLocale() {
    String locale = _storage.read('locale') ?? 'en_US';
    print(locale);
    Get.updateLocale(Locale(locale));
  }

  void changeLanguage(Locale newLocale){
    _storage.write('locale', newLocale.toString());
    Get.updateLocale(newLocale);
  }
  
}
