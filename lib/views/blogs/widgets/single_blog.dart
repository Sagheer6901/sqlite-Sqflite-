import 'package:epsumlorem/data/models/post_model.dart';
import 'package:epsumlorem/utils/constants.dart';
import 'package:epsumlorem/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SingleBlogWidget extends StatelessWidget {
  final PostModel post;

  const SingleBlogWidget({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.1),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      height: 150,
                      child: Image.memory(
                        post.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: "3 Feb".text.makeCentered(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "05 Mins Read",
                      size: 14,
                      weight: FontWeight.w300,
                    ),
                    CustomText(
                      text: post.title,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "22.2k",
                          size: 14,
                          weight: FontWeight.w500,
                          color: textColor,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: textColor,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "22.2k",
                          size: 14,
                          weight: FontWeight.w500,
                          color: textColor,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: textColor,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
