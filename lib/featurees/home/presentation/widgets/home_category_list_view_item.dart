import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import '../../data/models/category_model.dart';

class HomeCategoryListviewItem extends StatelessWidget {
  const HomeCategoryListviewItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        // minimumSize: Size(33, 33),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          border: Border.all(color: AppColors.bgBrownDark),
          borderRadius: BorderRadius.circular(33),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              category.categoryImage,
              height: 18.414138793945312,
              width: 14.491296768188477,
            ),
            const SizedBox(width: 2),
            Text(category.categoryName, style: AppStyles.styleExtraBold12),
          ],
        ),
      ),
    );
  }
}
