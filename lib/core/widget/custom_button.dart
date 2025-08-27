import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.passward, required this.text});
  final VoidCallback passward;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.dotactive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: passward,
        child: Text(text, style: AppStyles.styleSemiBold18),
      ),
    );
  }
}
