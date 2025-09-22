import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';

class ProductDetailsAbout extends StatelessWidget {
  const ProductDetailsAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Tincidunt cras volutpat aliquam porttitor molestie. "
      "Netus neque, habitasse id vulputate proin cras.",
      style: AppStyles.styleRegular14.copyWith(color: AppColors.bgBlack),
    );
  }
}
