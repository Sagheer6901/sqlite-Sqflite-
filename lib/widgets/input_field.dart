import 'package:epsumlorem/utils/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final String? Function(String?)? validator;
  final bool hideText, autoFocus;

  const InputField({
    super.key,
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.paddingVertical = 30,
    this.paddingHorizontal = 20,
    this.validator,
    this.hideText = false,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical!,
        horizontal: paddingHorizontal!,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: lightShadeColor, blurRadius: 2),
          ],
        ),
        child: TextFormField(
          autofocus: autoFocus,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: hideText,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                  )
                : null,
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 10),
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
            ),
            hintText: hint,
            border: _normalBorder(),
            focusedBorder: _normalBorder(),
            disabledBorder: _normalBorder(),
            enabledBorder: _normalBorder(),
            errorBorder: _errorBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _normalBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.05),
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
