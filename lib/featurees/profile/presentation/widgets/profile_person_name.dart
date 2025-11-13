import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';

class ProfilePersonName extends StatelessWidget {
  const ProfilePersonName({super.key});

  @override
  Widget build(BuildContext context) {
    // جلب عرض الشاشة للتصميم الريسبونسيف
    final screenWidth = MediaQuery.of(context).size.width;

    // تحديد أحجام ريسبونسيف حسب عرض الشاشة
    double fontSize = screenWidth < 400
        ? 16
        : screenWidth < 700
        ? 18
        : 20;

    double iconSize = screenWidth < 400
        ? 18
        : screenWidth < 700
        ? 20
        : 22;

    double spacing = screenWidth < 400
        ? 6
        : screenWidth < 700
        ? 8
        : 10;

    return Center(
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min, // عشان يجي وسط الشاشة
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'Lora Roberts',
              style: AppStyles.textInter16.copyWith(
                color: AppColors.bgBlack,
                fontSize: fontSize,
              ),
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: spacing),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              // هنا تضيفي أي أكشن للتعديل
            },
            icon: Icon(
              Icons.edit_outlined,
              size: iconSize,
              color: AppColors.bgBlack,
            ),
          ),
        ],
      ),
    );
  }
}
