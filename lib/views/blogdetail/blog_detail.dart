import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogDetail extends StatelessWidget {
  final PostModel post;

  const BlogDetail({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      height: 200,
                      child: Image.memory(
                        post.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Image.network(
                    //   "assets/images/logo.jpeg",
                    //   width: double.infinity,
                    // )
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 50,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Icon(Icons.bookmark_add_outlined),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text.rich(TextSpan(
                  style:
                      TextStyle(color: Colors.redAccent), //apply style to all
                  children: [
                    TextSpan(
                        text: 'By ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: textColor)),
                    TextSpan(
                        text: post.authorName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: iconColor.withOpacity(.5)))
                  ])),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: '${post.title}'.text.size(24).bold.make(),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: '${post.description}'
                  .text
                  .size(18)
                  .fontWeight(FontWeight.w400)
                  .color(textColor)
                  .make(),
            ))
          ],
        ),
      ),
    );
  }
}
