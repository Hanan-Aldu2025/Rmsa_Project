import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';

class ProductDetailsNameAndRating extends StatelessWidget {
  const ProductDetailsNameAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 30,
      right: 30,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        color: AppColors.bgBlack.withOpacity(0.25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text.rich(
            //   TextSpan(
            //     children: [
            //       TextSpan(
            //         text: "Cappuccino",
            //         style: AppStyles.styleBold24.copyWith(
            //           color: AppColors.bgWhite,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Text(
                "Cappuccino",
                style: AppStyles.styleBold24.copyWith(color: AppColors.bgWhite),
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentGeometry.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    // horizontal: 10,
                    vertical: 5,
                  ),
                  width: MediaQuery.of(context).size.width * .20,
                  decoration: BoxDecoration(
                    color: AppColors.bgBrownLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Icon(Icons.star, size: 18, color: AppColors.bgOrang),
                      SizedBox(width: 5),
                      Text(
                        "4.9",
                        style: AppStyles.styleBold15.copyWith(
                          color: AppColors.bgWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
