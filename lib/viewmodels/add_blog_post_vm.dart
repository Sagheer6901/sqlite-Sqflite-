import 'dart:typed_data';

import 'package:epsumlorem/repositories/post_repository.dart';
import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/views/blogs/blog_posts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBlogPostVieModel extends GetxController{
  final repository = PostRepository();

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  Rx<Uint8List?> webImage = Rx(Uint8List(8));
  var len = 1.obs;

  pick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker =
    await picker.pickImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      Uint8List bytes = await imagePicker.readAsBytes();
      webImage.value = bytes;
      len.value = bytes.length;
    } else {
      if (kDebugMode) {
        print('Pick Image First');
      }
    }
  }

  getEmail() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    return email;
  }
  uploadPost() async {

    int result;
    int date = DateTime.now().microsecondsSinceEpoch;
    var email= await getEmail();
    result = await repository.addPost(titleController.value.text, descriptionController.value.text, nameController.value.text, email, webImage.value,date );
    if(result >0){
      Get.to(()=> Blogs());
      nameController.clear();
      titleController.clear();
      descriptionController.clear();
    webImage.value!.clear();
      Get.snackbar("BLog Post",
          "Blog Posted Successfully",colorText: contentColor, backgroundColor: primaryColor);    }
  }

}