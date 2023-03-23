import 'package:epsumlorem/repositories/user_repository.dart';
import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/views/blogs/blog_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  final repository = UserRepository();

  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  Future vaildation() async {
    if (email.value.text.isEmpty && password.value.text.isEmpty) {
      Get.snackbar('!', "All Fleids Are Empty");
    } else if (email.value.text.isEmpty) {
      Get.snackbar('!', "Email Is Empty");
    } else if (!regExp.hasMatch(email.value.text.trim())) {
      Get.snackbar('!', "Email Is Not Vaild");
      Get.snackbar('!', "Password Is Empty");
    } else if (password.value.text.length < 3) {
      Get.snackbar('!', "Password Is Too Short");
    }
  }

  RxBool isPasswordVisible = true.obs;
  // late AppDB dbHelper;

  @override
  void onInit() async {
    repository.createProfile("sagheer", "sagheer@gmail.com", "sagheer");

    super.onInit();
  }

  userSignIn() {
    vaildation().then((_) async {
      bool userLogin = false;
      userLogin = await repository.userSignIn(
          email.value.text.trim(), password.value.text.trim());
      if (userLogin) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email.value.text);
        Get.to(() => Blogs());
        Get.snackbar("Login", "Successfully Login",
            colorText: contentColor, backgroundColor: primaryColor);
      } else {
        Get.snackbar("Invalid", "Email or password is incorrect",
            colorText: contentColor, backgroundColor: primaryColor);
      }
    });
  }
}
