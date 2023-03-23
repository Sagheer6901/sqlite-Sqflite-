
import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/repositories/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogPostViewModel extends GetxController {
  final repository = PostRepository();

  final postsList = <PostModel>[].obs;

  var uid = '';
  @override
  Future<void> onInit() async {
    postsList.value = await repository.getBlogPosts();
    super.onInit();
  }
  getBlogs() async {
     postsList.value = await repository.getBlogPosts();

  }

  @override
  void onClose() {
    super.onClose();
  }
}
