import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ProductDetailsBackButton extends StatelessWidget {
  const ProductDetailsBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 16,
      child: CircleAvatar(
        backgroundColor: AppColors.bgWhite.withOpacity(0.8),
        child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
      ),
    );
  }
}
