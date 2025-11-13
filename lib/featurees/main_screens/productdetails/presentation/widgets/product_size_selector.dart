import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/product_model.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<ProductSize> sizes;
  const ProductSizeSelector({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is! ProductDetailsLoaded) return const SizedBox.shrink();

        final cubit = context.read<ProductDetailsCubit>();
        final selected = state.selectedSize;

        if (sizes.length == 1 && sizes.first.size.toLowerCase() == "onesize") {
          return const SizedBox.shrink();
        }

        double containerWidth = screenWidth * 0.3; // 30% من عرض الشاشة
        double padding = screenWidth * 0.025; // 2.5% من عرض الشاشة
        double circleSize = screenWidth * 0.045; // 4.5% من عرض الشاشة
        double innerCircleSize = screenWidth * 0.025; // 2.5% من عرض الشاشة
        double borderRadius = 12.0;

        return Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Size",
                style: AppStyles.titleLora18.copyWith(
                  fontSize: screenWidth * 0.045, // حجم خط نسبي
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: screenWidth * 0.025,
                runSpacing: screenHeight * 0.015,
                children: sizes.map((s) {
                  final isSelected = s.size == selected;
                  return GestureDetector(
                    onTap: () => cubit.selectSize(s.size),
                    child: Container(
                      width: containerWidth,
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderColor,
                            blurRadius: 4,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: circleSize,
                                height: circleSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: innerCircleSize,
                                          height: innerCircleSize,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.bgBrownMedium,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                s.label,
                                style: AppStyles.textInter16.copyWith(
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          if (s.sizeOz != null)
                            Center(
                              child: Text(
                                "${s.sizeOz} oz",
                                style: AppStyles.textInter14Gray.copyWith(
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ),
                          SizedBox(height: screenHeight * 0.005),
                          Center(
                            child: Text(
                              "\$${s.price.toStringAsFixed(2)}",
                              style: AppStyles.textInter16.copyWith(
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
