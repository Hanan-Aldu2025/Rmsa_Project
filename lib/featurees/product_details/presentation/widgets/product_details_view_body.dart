import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_style.dart';
import 'product_details_about.dart';
import 'product_details_add_product_to_cart_button.dart';
import 'product_details_topping_item_row.dart';
import 'product_details_back_button.dart';
import 'product_details_name_and_rating.dart';
import 'product_details_size_button.dart';
import 'product_details_image_header.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // صورة الخلفية
                  ProductDetailsImageHeader(),

                  // زر الرجوع
                  ProductDetailsBackButton(),

                  // خلفية التقييم + النص
                  ProductDetailsNameAndRating(),
                ],
              ),

              Transform.translate(
                offset: const Offset(
                  0,
                  -30,
                ), // نرفع الكونتينر الأبيض فوق الصورة
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // حجم القهوة
                      const Text("Coffee Size", style: AppStyles.styleBold18),
                      const SizedBox(height: 12),
                      Wrap(
                        children: const [
                          ProductDetailsSizeButton(
                            sizeText: "Small",
                            isSelected: true,
                          ),
                          ProductDetailsSizeButton(
                            sizeText: "Medium",
                            isSelected: false,
                          ),
                          ProductDetailsSizeButton(
                            sizeText: "Large",
                            isSelected: false,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // الوصف
                      Text("About", style: AppStyles.styleBold18),
                      const SizedBox(height: 8),
                      ProductDetailsAbout(),
                      const SizedBox(height: 20),

                      // الإضافات
                      Text("Add Topping", style: AppStyles.styleBold18),
                      const SizedBox(height: 12),
                      const ProductDetailsToppingItemRow(
                        topping: "Caramel",
                        count: "0",
                      ),
                      const ProductDetailsToppingItemRow(
                        topping: "Banana",
                        count: "0",
                      ),
                      const ProductDetailsToppingItemRow(
                        topping: "Chocolate",
                        count: "1",
                      ),
                      const ProductDetailsToppingItemRow(
                        topping: "Strawberry",
                        count: "0",
                      ),
                      const SizedBox(height: 30),

                      // زر إضافة للسلة
                      const ProductDetailsAddToCartButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
