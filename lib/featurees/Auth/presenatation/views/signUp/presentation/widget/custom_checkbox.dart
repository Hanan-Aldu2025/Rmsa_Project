import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isCheckbox,
    required this.onchanged,
  });
  final bool isCheckbox;
  final ValueChanged<bool> onchanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onchanged(!isCheckbox);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isCheckbox ? AppColors.bgBrownDark : Colors.white, // خلفية
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: isCheckbox ? Colors.transparent : Colors.grey, // حدود
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isCheckbox
            ? const Icon(
                Icons.check,
                color: Colors.white, // الصح أبيض
                size: 16,
              )
            : null,
      ),
    );
  }
}
