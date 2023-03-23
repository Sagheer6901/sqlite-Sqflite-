import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/viewmodels/login_vm.dart';
import 'package:epsumlorem/widgets/inputTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:velocity_x/velocity_x.dart';


class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  var h, w;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginViewModel());

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contentColor,
        title: 'Login'.text.fontWeight(FontWeight.w500).color(iconColor).size(22).makeCentered(),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: iconColor,
              size: 30,
            )),
        elevation: 0,

      ),

      backgroundColor: contentColor,
      // appBar: 'app_name'.tr.text.size(18).make().centered(),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InputTextWidget(
                  controller: controller.email.value,
                  labelText: "Email Address",
                  icon: Icons.email,
                  obscureText: false,
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 25.0,
              ),
              Obx(() => Stack(children: [
                    InputTextWidget(
                        controller: controller.password.value,
                        labelText: "Password",
                        icon: Icons.lock,
                        inputAction: TextInputAction.next,
                        obscureText: controller.isPasswordVisible.value,
                        keyboardType: TextInputType.text),
                    Positioned(
                        top: 5,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: iconColor.withOpacity(.5),
                          ),
                          onPressed: () {
                            if (controller.isPasswordVisible.value == false) {
                              controller.isPasswordVisible.value = true;
                            } else {
                              controller.isPasswordVisible.value = false;
                            }
                          },
                        ))
                  ])),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: Center(
                    child: InkWell(
                        onTap: () async {
                          controller.userSignIn();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: contentColor),
                        ))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: textColor.withOpacity(0.8)),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: textColor.withOpacity(0.8),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: iconColor),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: textColor.withOpacity(0.8),
                    )),
                  ],
                ),
              ),
              Column(
                children: [

                  const SizedBox(height: 10),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.apple,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
