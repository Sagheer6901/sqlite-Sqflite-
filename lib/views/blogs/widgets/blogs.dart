import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/viewmodels/blog_posts_vm.dart';
import 'package:epsumlorem/views/blogdetail/blog_detail.dart';
import 'package:epsumlorem/views/blogs/widgets/single_blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogsWidget extends StatelessWidget {
  final BlogPostViewModel controller;
  const BlogsWidget({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.postsList.value.length,
        itemBuilder: (context, index) {
          return controller.postsList.value.isNotEmpty?Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Obx(() => InkWell(
                onTap: () => Get.to(
                        () => BlogDetail(post: controller.postsList.value[index])),
                child:
                SingleBlogWidget(post: controller.postsList.value[index]))),
          ):'No blog post available'.text.size(20).fontWeight(FontWeight.w400).color(iconColor.withOpacity(.5)).makeCentered();
        }));
  }
}
