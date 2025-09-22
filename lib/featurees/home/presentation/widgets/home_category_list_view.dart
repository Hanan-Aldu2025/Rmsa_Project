import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';
import '../../data/models/category_model.dart';
import 'home_category_list_view_item.dart';

class HomeCategoryListView extends StatelessWidget {
  HomeCategoryListView({super.key});
  final List<CategoryModel> categoryModel = [
    CategoryModel(
      categoryName: "COFFEE",
      categoryImage: SvgImages.imagesCaffee,
      isSelected: true,
    ),
    CategoryModel(
      categoryName: "DESSERTS",
      categoryImage: SvgImages.imagesDessert,
      isSelected: false,
    ),
    CategoryModel(
      categoryName: "ALCOHOL",
      categoryImage: SvgImages.imagesCohole,
      isSelected: true,
    ),
    CategoryModel(
      categoryName: "ALCOHOL FREE",
      categoryImage: SvgImages.imagesCoholeFree,
      isSelected: false,
    ),
    CategoryModel(
      categoryName: "BREAKFAST",
      categoryImage: SvgImages.imagesBreakfast,
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Wrap(
        // spacing: 10, // المسافة الأفقية بين العناصر
        runSpacing: 5, // المسافة العمودية بين الصفوف
        children: List.generate(categoryModel.length, (index) {
          final category = categoryModel[index];
          return HomeCategoryListviewItem(category: category);
        }),
      ),
    );
  }
}
