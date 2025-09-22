import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class CustomProductImageandFavorite extends StatelessWidget {
  const CustomProductImageandFavorite({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(7),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.asset(
              product.productImage,
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: GestureDetector(
            onTap: () {
              print('Test Print Favorite');
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.bgWhite.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 18,
                color: AppColors.bgBrownDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
