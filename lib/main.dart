import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/api/api_service.dart';
import 'package:flutter_setup/common/config.dart';
import 'package:flutter_setup/common/controller_binding.dart';
import 'package:flutter_setup/common/app_helper.dart';
import 'package:flutter_setup/lang/language.dart';
import 'package:flutter_setup/routes/route.dart';
import 'package:get/get.dart';
import 'common/enum/app_enum.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.transformer = BackgroundTransformer();
    if (AppConfig.networkDebug != NetworkDebug.close &&
        AppConfig.appMode != AppMode.production) {
      dio.interceptors.add(LogInterceptor(
          logPrint: (log) => print(log),
          responseBody: AppHelper.showNetworkLogBody(),
          responseHeader: AppHelper.showNetworkLogHeader(),
          requestBody: AppHelper.showNetworkLogBody(),
          requestHeader: AppHelper.showNetworkLogHeader()));
    }
    Get.put(ApiService(dio));
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      title: 'Flutter App',
      initialRoute: '/',
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppRoutes.getPages(),
    );
  }
}
