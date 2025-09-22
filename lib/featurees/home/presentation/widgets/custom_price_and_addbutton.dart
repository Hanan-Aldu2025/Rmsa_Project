import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../data/models/product_model.dart';

class CustomPriceAndAddButton extends StatelessWidget {
  const CustomPriceAndAddButton({
    super.key,
    required this.product,
    required this.deviceWidth,
  });

  final ProductModel product;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${product.productPrice}",
            style: TextStyle(
              color: AppColors.bgBrownMedium,
              fontSize: deviceWidth < 350 ? 12 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextButton(
            style: TextButton.styleFrom(
              // minimumSize: Size(33, 33),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.bgBrownMedium,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: AppColors.bgWhite, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
