import 'package:epsumlorem/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width,height;
  final Color? color;
  final bool? isShadow;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.color, this.textColor, this.height, this.isShadow, this.textSize, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: width ?? Get.width * 0.5,
        height: height??60,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            isShadow==true?BoxShadow(color: lightShadeColor,blurRadius:30,spreadRadius: 2):BoxShadow(color: Colors.white,spreadRadius: 2)
          ]
        ),
        child: Center(
          child: CustomText(
            text: label,
            size: textSize??25,
            weight: fontWeight??FontWeight.w400,
            color: textColor??contentColor,
          ),
        ),
      ),
    );
  }
}
