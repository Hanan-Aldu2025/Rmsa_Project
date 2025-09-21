import 'package:appp/generated/l10n.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';


class CustomTextFormFiled extends StatelessWidget {
  final String hinttext;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    super.key,
    required this.hinttext,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).enterEmail; // رسالة عند الحقل الفارغ
        }
        if (validator != null) {
          return validator!(value); // استدعاء الـ validator الخارجي
        }
        return null;
      },
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
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.bklbrownlight10, width: 0.1),
    );
  }
}