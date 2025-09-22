import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProductDetailsToppingItemRow extends StatelessWidget {
  const ProductDetailsToppingItemRow({
    super.key,
    required this.topping,
    required this.count,
  });

  final String topping;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              topping,
              style: AppStyles.styleMedium16.copyWith(color: AppColors.bgBlack),
            ),
          ),

          Expanded(
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: Wrap(
                // crossAxisAlignment: WrapCrossAlignment.end,
                // alignment: WrapAlignment.end,
                spacing: 8,
                children: [
                  Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.bgBrownLight,
                    size: 28,
                  ),
                  Text(count, style: AppStyles.styleBold16),
                  Icon(
                    Icons.add_circle_outline,
                    color: AppColors.bgBrownLight,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
