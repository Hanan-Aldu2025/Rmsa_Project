import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSizeProduct extends StatelessWidget {
  const CustomSizeProduct({
    super.key,
    required this.isSelected,
    required this.size,
  });

  final bool isSelected;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bgBrownMedium : AppColors.bgWhite,
          border: Border.all(
            color: isSelected ? AppColors.bgBrownMedium : Colors.brown.shade300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? AppColors.bgWhite : AppColors.bgBrownMedium,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
