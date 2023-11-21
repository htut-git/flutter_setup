import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkcheckService extends GetxService {
  RxBool networkStatus = true.obs;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      debugPrint(result.toString());
      checkConnection();
    });
    super.onInit();
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  Future<void> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    networkStatus.value = (result != ConnectivityResult.none);
    showSnackBarConnectionStatus();
  }

  void showSnackBarConnectionStatus() {
    Get.closeCurrentSnackbar();
    if (networkStatus.value) {
      Get.snackbar(
        'Success',
        'Connected to the Internet',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'No Internet Connection',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
