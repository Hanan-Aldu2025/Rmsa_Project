import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';
import '../../data/models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.text,
    this.product,
    required this.onPressed,
  });

  final String text;
  final ProductModel? product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      onPressed: onPressed,

      // () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => ProductDetailsView(product: product!),
      //     ),
      //   );
      // },
      icon: const Icon(Icons.add),
      label: Text(
        text,
        style: AppStyles.textInter14Gray.copyWith(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
