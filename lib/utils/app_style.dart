import 'package:flutter/material.dart';

abstract class AppStyles {
  // 🔹 Lora 24 Black
  static final TextStyle titleLora24 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 24,
    fontFamily: 'Lora',
    fontWeight: FontWeight.w700, // Bold
  );

  // 🔹 Lora 18 SemiBold
  static final TextStyle titleLora18 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 18,
    fontFamily: 'Lora',
    fontWeight: FontWeight.w600, // SemiBold
  );

  // 🔹 Lora 16 Medium
  static final TextStyle textLora16 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16,
    fontFamily: 'Lora',
    fontWeight: FontWeight.w500, // Medium
  );

  // 🔹 Lora 12 Gray (#C0C4CC)
  static final TextStyle textLora12Gray = TextStyle(
    color: Color(0xFFC0C4CC),
    fontSize: 12,
    fontFamily: 'Lora',
    fontWeight: FontWeight.w400, // Regular
  );

  // 🔹 Inter 16 Medium
  static final TextStyle textInter16 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500, // Medium
  );

  // 🔹 Inter 14 Gray (#565D6D)
  static final TextStyle textInter14Gray = TextStyle(
    color: Color(0xFF565D6D),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400, // Regular
  );
}

// abstract class AppStyles {
//   //ExtraBold
//   static const TextStyle styleExtraBold16 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 16,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w800,
//   );

//   static const TextStyle styleExtraBold12 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 12,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w800,
//   );

//   //Bold
//   static const TextStyle styleBold36 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 36,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );
//   static const TextStyle styleBold24 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 24,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );

//   static const TextStyle styleBold28 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 28,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );

//   static const TextStyle styleBold20 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 20,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );
//   static const TextStyle styleBold18 = TextStyle(
//     // color: Color(0xFF452F22), // بني غامق
//     fontSize: 18,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );

//   static const TextStyle styleBold15 = TextStyle(
//     color: Color(0xFFCB8A58), //#CB8A58
//     fontSize: 15,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );

//   static const TextStyle styleBold12 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 12,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );

//   //Semi Bold
//   static const TextStyle styleSemiBold22 = TextStyle(
//     color: Color(0xFFFFFFFF), //#FFFFFF
//     fontSize: 22,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w600,
//   );

//   //Regular
//   static const TextStyle styleRegular24 = TextStyle(
//     color: Color(0xFF8F9698), //#8F9698
//     fontSize: 24,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle styleRegular20 = TextStyle(
//     color: Color(0xFFFFFFFF), //#FFFFFF
//     fontSize: 20,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   static const TextStyle styleRegular18 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 18,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   static const TextStyle styleRegular16 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 36,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   static const TextStyle styleRegular12 = TextStyle(
//     color: Color(0xFFCBCBD4), //#CBCBD4
//     fontSize: 12,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   static const TextStyle styleRegular10 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 10,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   //Light
//   static const TextStyle styleLight20 = TextStyle(
//     color: Color(0xFFD2AE82), //#D2AE82
//     fontSize: 20,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w300,
//   );

//   static const TextStyle styleLight16 = TextStyle(
//     color: Color(0xFF0A191E), //#0A191E
//     fontSize: 16,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w300,
//   );

//   //----------------------------------------------------------------------------

//   // static const TextStyle styleRegular12 = TextStyle(
//   //   color: Color(0xFFAAAAAA),
//   //   fontSize: 12,
//   //   fontFamily: 'Montserrat',
//   //   fontWeight: FontWeight.w400,
//   // );
//   // static const TextStyle styleRegular18 = TextStyle(
//   //   color: Color.fromARGB(255, 253, 253, 253),
//   //   fontSize: 18,
//   //   fontFamily: 'Montserrat',
//   //   fontWeight: FontWeight.w400,
//   // );

//   static const TextStyle styleRegular14 = TextStyle(
//     color: Color(0xFFFF8C42),
//     fontSize: 14,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );
//   static const TextStyle styleRegular13 = TextStyle(
//     color: Color(0xFF6F4E37),
//     fontSize: 13,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w400,
//   );

//   // static const TextStyle styleRegular16 = TextStyle(
//   //   color: Color(0xFF452F22), // بني غامق
//   //   fontSize: 16,
//   //   fontFamily: 'Montserrat',
//   //   fontWeight: FontWeight.w700,
//   // );

//   static const TextStyle styleMedium16 = TextStyle(
//     color: Color(0xFFFF8C42), // بني برتقالي
//     fontSize: 16,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w500,
//   );

//   static const TextStyle styleMedium20 = TextStyle(
//     color: Color(0xFF6F4E37), // بني فاتح
//     fontSize: 20,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w500,
//   );

//   static const TextStyle styleSemiBold16 = TextStyle(
//     color: Color(0xFF452F22), // بني غامق
//     fontSize: 16,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w600,
//   );

//   static const TextStyle styleSemiBold18 = TextStyle(
//     color: Color(0xFFFFE7DB), // بني غامق
//     fontSize: 18,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w600,
//   );

//   static const TextStyle styleSemiBold46 = TextStyle(
//     color: Color(0xFF452F22), // بني غامق
//     fontSize: 46,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w600,
//   );

//   static const TextStyle styleSemiBold24 = TextStyle(
//     color: Color(0xFFFF8C42), // برتقالي
//     fontSize: 24,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w600,
//   );

//   static const TextStyle styleBold16 = TextStyle(
//     color: Color(0xFF452F22), // بني غامق
//     fontSize: 16,
//     fontFamily: 'Montserrat',
//     fontWeight: FontWeight.w700,
//   );
// }
