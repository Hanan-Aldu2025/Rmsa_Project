import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hinttext;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  const CustomTextFormFiled({
    super.key,
    required this.hinttext,
    required this.textInputType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: AppStyles.styleRegular12,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: AppColors.bklbrownlight10,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.bklbrownlight10, width: 0.1),
    );
  }
}
