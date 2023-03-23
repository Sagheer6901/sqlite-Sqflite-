import 'dart:async';
import 'package:epsumlorem/views/AuthScreens/login.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController {
  @override
  void onInit() {
    timeFunc();
    super.onInit();
  }

  void timeFunc() {
    Timer(Duration(seconds: 3), () => Get.to(() => Login()));
  }
}
