import 'package:flutter/material.dart';

import '../../../../utils/app_style.dart';

class ProfileInformationRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onEdit;

  const ProfileInformationRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    //---------------------------- اقدر احذف هذه المتغيرات و القيم و استخدم حق التطبيق طبيعي
    // جلب عرض الشاشة للتصميم الريسبونسيف
    final screenWidth = MediaQuery.of(context).size.width;

    // تحديد أحجام ريسبونسيف حسب عرض الشاشة
    double fontSize = screenWidth < 400
        ? 12
        : screenWidth < 700
        ? 13
        : 15;

    double iconSize = screenWidth < 400
        ? 18
        : screenWidth < 700
        ? 20
        : 22;
    return Row(
      // crossAxisAlignment: WrapCrossAlignment.start,
      // alignment: WrapAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: Wrap(
            children: [
              Icon(icon, size: iconSize, color: Colors.black87),
              SizedBox(width: 10),
              // const SizedBox(width: 14),
              Text(
                title,
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style: AppStyles.styleExtraBold12.copyWith(fontSize: fontSize),
              ),
            ],
          ),
        ),

        Expanded(
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onEdit,
              icon: Icon(Icons.edit_outlined, size: iconSize),
            ),
          ),
        ),
      ],
    );
  }
}
