import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
    try {
      // not work in Browser 
      var isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (isDeviceConnected) {
        networkStatus.value = true;
      }else{
        networkStatus.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
