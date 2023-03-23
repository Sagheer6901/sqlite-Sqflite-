import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/views/blogs/blog_posts.dart';
import 'package:epsumlorem/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(email == null
        ? const MyApp()
        : GetMaterialApp(debugShowCheckedModeBanner: false, home: Blogs()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: contentColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark
        //color set to transperent or set your own color
        ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Splash_Screen()),
    );
  }
}
