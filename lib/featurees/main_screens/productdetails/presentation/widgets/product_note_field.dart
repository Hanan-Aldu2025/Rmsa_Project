import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProductNoteField extends StatelessWidget {
  const ProductNoteField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add your note", style: AppStyles.titleLora18),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backGray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Write your note",
              hintStyle: AppStyles.textLora12Gray.copyWith(
                color: AppColors.iconColorDark,
              ),
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
