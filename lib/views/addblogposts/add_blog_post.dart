
import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/viewmodels/add_blog_post_vm.dart';
import 'package:epsumlorem/views/blogs/blog_posts.dart';
import 'package:epsumlorem/widgets/custom_button.dart';
import 'package:epsumlorem/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBlogPost extends StatelessWidget {
  AddBlogPost({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddBlogPostVieModel());

    return Scaffold(

      appBar: AppBar(
        backgroundColor: contentColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: iconColor,
              size: 30,
            )),

        elevation: 0,

      ),
      backgroundColor: Colors.white,

      // bottomSheet: Text("dfsdfsdf"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InputField(
                controller: controller.nameController,
                hint: 'author name',
                suffixIcon: Icons.edit,
                validator: (ct) {
                  if (controller.nameController.text.length <= 1) {
                    return "invalid author name";
                  }
                },
              ),

              InputField(
                controller: controller.titleController,
                hint: 'title',
                suffixIcon: Icons.edit,
                validator: (ct) {
                  if (controller.titleController.text.length <= 6) {
                    return "title must be 6 character long";
                  }
                },
              ),

              InputField(
                controller: controller.descriptionController,
                hint: 'description',
                suffixIcon: Icons.edit,
                validator: (ct) {
                  if (controller.descriptionController.text.length < 50) {
                    return "name must be 50 character long";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                    () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: lightShadeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    width: double.infinity,
                    child: controller.len.value == 1
                        ? IconButton(
                      onPressed: () {
                        controller.pick();
                      },
                      icon: Icon(
                        Icons.cloud_upload_outlined,
                        color: contentColor,
                        size: 60,
                      ),
                    )
                        : InkWell(
                        onTap: () {
                          controller.pick();
                        },
                        child: Center(
                          child: Image.memory(controller.webImage.value!,fit: BoxFit.cover,),
                          //     child: Text(
                          //   "Image Selected",
                          //   style: TextStyle(
                          //       color: AppColors.primary,
                          //       fontWeight: FontWeight.w800,
                          //       fontSize: 18),
                          // )
                        )
                    )),
              ),

              Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 50, top: 10),
                  child: CustomButton(
                      label: "Post Event",
                      color: primaryColor,
                      textColor: contentColor,
                      onTap: () async {
                        if (controller.len > 1 &&
                            controller.nameController.text.length >1 &&
                            controller.titleController.text.length >= 6 &&
                            controller.descriptionController.text.length >= 10) {
                          await controller.uploadPost();
                          // controller.onBack();
                        } else {
                          print("hello");
                          Get.snackbar(
                              "Incomplete Info", "Please complete all fields",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: primaryColor,
                              colorText: contentColor);
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
