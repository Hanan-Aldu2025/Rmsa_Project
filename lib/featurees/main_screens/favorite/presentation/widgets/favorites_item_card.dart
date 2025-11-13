import 'package:appp/featurees/main_screens/home/data/models/product_model.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'quantity_button.dart';

class FavoriteItemCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const FavoriteItemCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final imageSize = width * 0.18;
    // final fontTitle = width * 0.045;
    // final fontSubtitle = width * 0.038;
    final buttonSize = width * 0.08;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.all(width * 0.025),
      decoration: BoxDecoration(
        color: AppColors.backGray,
        borderRadius: BorderRadius.circular(width * 0.04),
        boxShadow: [
          BoxShadow(
            color: AppColors.softGray,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(width * 0.03),
            child: Image.network(
              product.imageUrl,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: width * 0.035),

          // تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyles.textLora16.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Text(
                      '${product.price}\$',
                      style: AppStyles.textInter14Gray.copyWith(fontSize: 15),
                    ),
                    SizedBox(width: width * 0.03),
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                  ],
                ),
              ],
            ),
          ),

          // أزرار الكمية
          Row(
            children: [
              QuantityButton(
                icon: Icons.remove,
                onTap: onDecrease,
                size: buttonSize,
              ),
              SizedBox(width: width * 0.015),
              Text(
                quantity.toString(),
                style: AppStyles.titleLora18.copyWith(fontSize: 15),
              ),
              SizedBox(width: width * 0.015),
              QuantityButton(
                icon: Icons.add,
                onTap: onIncrease,
                size: buttonSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
