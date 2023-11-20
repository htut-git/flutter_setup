import 'package:dio/dio.dart';
import 'package:flutter_setup/common/config.dart';

import 'enum/app_enum.dart';

class AppHelper {
  static bool showNetworkLogBody() {
    if (AppConfig.networkDebug == NetworkDebug.body ||
        AppConfig.networkDebug == NetworkDebug.headerAndBody) {
      return true;
    } else {
      return false;
    }
  }

  static bool showNetworkLogHeader() {
    if (AppConfig.networkDebug == NetworkDebug.header ||
        AppConfig.networkDebug == NetworkDebug.headerAndBody) {
      return true;
    } else {
      return false;
    }
  }

  static Map<String, dynamic> getApiError(DioException error) {
    if (error.response != null && error.response?.data != null) {
      return error.response!.data;
    }
    return Map<String, dynamic>();
  }
}
