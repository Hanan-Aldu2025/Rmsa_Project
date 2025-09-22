import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProductDetailsAddToCartButton extends StatelessWidget {
  const ProductDetailsAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 55,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.bgBlack,
            borderRadius: BorderRadius.circular(30),
          ),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Add to Cart",
                    style: AppStyles.styleBold16.copyWith(
                      color: AppColors.bgWhite,
                    ),
                  ),
                ),
                Expanded(
                  child: VerticalDivider(
                    color: AppColors.bgWhite,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),

                Expanded(
                  child: Text(
                    "4\$",
                    style: AppStyles.styleBold16.copyWith(
                      color: AppColors.bgWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
