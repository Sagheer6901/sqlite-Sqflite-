import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/viewmodels/splash_vm.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenViewModel());

    return Container(
        color: contentColor,
        child: Center(
          child: Image.asset("assets/images/logo.jpeg"),
        ));
  }
}

