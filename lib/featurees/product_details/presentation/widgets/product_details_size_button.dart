import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ProductDetailsSizeButton extends StatelessWidget {
  const ProductDetailsSizeButton({
    super.key,
    required this.isSelected,
    required this.sizeText,
  });
  final bool isSelected;
  final String sizeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: MediaQuery.of(context).size.width * .30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? AppColors.bgBrownLight
              : AppColors.bgWhite,
          foregroundColor: isSelected ? AppColors.bgWhite : AppColors.bgBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected
                  ? AppColors.bgBrownLight
                  : AppColors.bgGreyMedium, //Colors.grey.shade400
            ),
          ),
        ),
        onPressed: () {},
        child: Text(sizeText),
      ),
    );
  }
}
