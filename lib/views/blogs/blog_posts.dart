import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/viewmodels/blog_posts_vm.dart';
import 'package:epsumlorem/views/addblogposts/add_blog_post.dart';
import 'package:epsumlorem/views/blogs/widgets/blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Blogs extends StatelessWidget {
  // const Homepage({Key? key}) : super(key: key);

  // final h, w;
  // final postController = Get.put(PostsController());
  // final userController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(BlogPostViewModel());

    // h = MediaQuery.of(context).size.height;
    // w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: contentColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dehaze,
              color: iconColor,
              size: 30,
            )),
        actions: [
          CircleAvatar(
            child: Image.asset("assets/images/user.png"),
            backgroundColor: Colors.white,
            // backgroundImage: AssetImage("assets/images/user.png"),
          ),
          // Icon(
          //   Icons.search_outlined,
          //   color: contentColor,
          //   size: 30,
          // ),
          const SizedBox(
            width: 15,
          )
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false; //<-- SEE HERE
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Blogs'.text.size(24).bold.make(),
              Container(
                // margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  onSubmitted: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search Blogs",
                    hintStyle:
                        TextStyle(fontSize: 15, color: textColor.withOpacity(.8)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: const TextStyle(color: primaryColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: iconColor,
                      size: 30,
                    ),
                    suffixIcon: SizedBox(
                      width: 40,
                      height: 25,
                      child: IconButton(
                        icon: const Icon(
                          Icons.manage_search,
                          size: 30,
                          color: iconColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    border: InputBorder.none,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: shadeColor, width: 1.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await _controller.getBlogs();
                  },
                  child: BlogsWidget(
                    controller: _controller,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddBlogPost());
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
