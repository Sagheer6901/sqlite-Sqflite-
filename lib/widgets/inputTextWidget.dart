import 'package:epsumlorem/utils/constants.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final keyboardType;
  final controller;
  final inputAction;

  const InputTextWidget(
      {required this.labelText,
      required this.icon,
      required this.obscureText,
      required this.keyboardType,
      this.inputAction = TextInputAction.done,
      this.controller})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 0.0,
        shadowColor: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 15.0),
          child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              autofocus: false,
              keyboardType: keyboardType,
              textInputAction: inputAction,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle:  TextStyle(color: textColor.withOpacity(0.8), fontSize: 14.0),
                hintText: '',
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                border: InputBorder.none,
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'le champ de texte est vide!';
                }
              }),
        ),
      ),
    );
  }
}
