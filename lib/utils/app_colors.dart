import 'package:flutter/material.dart';

abstract class AppColors {
  // اللون الأساسي للمشروع
  static const Color primaryColor = Color(0xFF3D0E00);

  // لون الخلفية العامة
  static const Color backgroundColor = Color(0xFFFFF3F0);

  // لون الضغط على الأزرار
  static const Color onPressedColor = Color(0xFF731B00);

  // لون الخلفية الرمادية الفاتحة (مثل خلفيات الحقول أو البطاقات)
  static const Color backGray = Color(0xFFF3F4F6);

  // لون رمادي أغمق قليلًا (مثلاً للشاشات الثانوية أو التباين)
  static const Color softGray = Color(0xFFDEE1E6);

  // الأسود القياسي للنصوص أو الأيقونات
  static const Color blackColor = Color(0xFF000000);
  // الأسود القياسي للنصوص أو الأيقونات
  static const Color whiteColor = Color(
    0xFFFFFFFF,
  ); //#565D6DFF #565D6DFF //back F3F4F680 FAFAFBFF
  // يستخدم للون الايقونات
  static const Color iconColorDark = Color(0xFF565D6D);
  static const Color iconColorlight = Color(0xFFA6A6A7); // #565D6DFF
  // يستخدم للبوردر حق الحقول
  static const Color borderColor = Color(0xFFDEE1E6);

  // ====== BACKGROUND COLORS ======
  static const Color bgBlack = Color(0xFF020202);
  static const Color bgBrownDark = Color(0xFF412011);
  static const Color bgBrownLight = Color(0xFF9B5730);
  static const Color bgorangLight = Color(0xFFFFE7DB);
  static const Color bgScaffold = Color(0xFFFFE7DB);
  static const Color bgBrownDarkTransparent = Color(0x80452F22);
  static const Color bklbrownlight10 = Color.fromARGB(29, 150, 86, 51);

  static const Color dotactive = Color(0xFF412011);
  //-------------------------------------------------------------------
  //  static const Color bgBlack = Color(0xFF020202);
  // static const Color bgBrownDark = Color(0xFF412011);
  // static const Color bgBrownLight = Color(0xFF9B5730);
  static const Color bgBrownMedium = Color.fromARGB(255, 93, 64, 55);
  // static const Color bgorangLight = Color(0xFFFFE7DB);
  // static const Color bgScaffold = Color(0xFFFFE7DB);
  // static const Color bgBrownDarkTransparent = Color(0x80452F22);
  // static const Color bklbrownlight10 = Color.fromARGB(29, 150, 86, 51);
  // static const Color dotactive = Color.fromARGB(255, 209, 75, 8);
  static const Color bgWhite = Colors.white;
  static const Color bgGrey = Colors.grey; //Colors.grey[200]
  static const Color bgGreyMedium = Color(0xFFBFBDC0);
  static const Color bgGreyLight = Color.fromARGB(255, 238, 238, 238);
  static const Color bgOrang = Colors.orange;
}
