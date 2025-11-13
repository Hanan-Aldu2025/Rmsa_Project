import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;

  const AppSearchField({
    super.key,
    this.hintText = "Search...",
    this.onChanged,
    this.controller,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? TextEditingController();
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.055,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.backGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.search,
            color: AppColors.iconColorlight,
            size: size.width * 0.045,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: textController,
              style: AppStyles.textInter14Gray.copyWith(color: Colors.black),
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: AppStyles.textInter14Gray,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
