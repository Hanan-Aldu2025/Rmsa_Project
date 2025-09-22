import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';
import '../../../product_details/presentation/views/product_details_view.dart';
import '../../data/models/product_model.dart';
import 'custom_price_and_addbutton.dart';
import 'custom_product_image_and_favorite.dart';
import 'custom_size_product.dart';

class HomeProductListView extends StatefulWidget {
  const HomeProductListView({super.key});
  @override
  State<HomeProductListView> createState() => _HomeProductListViewState();
}

class _HomeProductListViewState extends State<HomeProductListView> {
  // البيانات التجريبية
  final List<ProductModel> productModel = [
    ProductModel(
      productName: "Cappuccino",
      productImage: SvgImages.imagesCappuccino,
      productPrice: '3',
      productSizes: ["S", "M", "L"],
    ),
    ProductModel(
      productName: "Espresso",
      productImage: SvgImages.imagesEspresso,
      productPrice: '2',
      productSizes: ["S"],
    ),
    ProductModel(
      productName: "Americano",
      productImage: SvgImages.imagesAmericano,
      productPrice: '2.5',
      productSizes: ["S", "L"],
    ),
    ProductModel(
      productName: "Latte",
      productImage: SvgImages.imagesLatte,
      productPrice: '4',
      productSizes: ["S", "M", "L"],
    ),
    ProductModel(
      productName: "Latte",
      productImage: SvgImages.imagesLatte,
      productPrice: '4',
      productSizes: ["S", "M", "L"],
    ),
  ];

  // نخزن الحجم المختار لكل منتج
  final Map<int, String> selectedSizes = {};

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    final double childAspectRatio = deviceWidth >= 250 && deviceWidth < 270
        ? 0.40
        : deviceWidth >= 270 && deviceWidth < 300
        ? 0.43
        : deviceWidth >= 300 && deviceWidth < 350
        ? 0.51
        : deviceWidth >= 350 && deviceWidth < 400
        ? 0.60
        : 0.65;

    // تحديد الأعمدة حسب حجم الشاشة
    int crossAxisCount;
    if (deviceWidth < 350) {
      crossAxisCount = 2;
    } else if (deviceWidth < 600) {
      crossAxisCount = 2;
    } else if (deviceWidth < 900) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.builder(
        itemCount: productModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // عدد الأعمدة
          crossAxisSpacing: 30, // المسافة الأفقية بين العناصر
          mainAxisSpacing: 22, // المسافة العمودية بين الصفوف
          childAspectRatio: childAspectRatio, // التحكم بنسبة أبعاد البطاقة
        ),
        itemBuilder: (context, index) {
          final product = productModel[index];
          final selectedSize = selectedSizes[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductDetailsView()),
              );
              // Navigator.of(
              //   context,
              // ).pushReplacementNamed(ProductDetailsView.routeName);
              print('Test Print Product');
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgWhite,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.bgGreyMedium),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة المنتج + المفضلة
                  CustomProductImageandFavorite(product: product),
                  // اسم المنتج
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 6),
                    child: Text(
                      product.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth < 350 ? 12 : 14,
                        color: AppColors.bgBrownMedium,
                      ),
                    ),
                  ),

                  // الأحجام S - M - L
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 6),
                    child: Row(
                      children: product.productSizes.map((size) {
                        final isSelected = selectedSize == size;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizes[index] = size;
                            });
                          },

                          child: CustomSizeProduct(
                            isSelected: isSelected,
                            size: size,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(),
                  // السعر + زر الإضافة
                  CustomPriceAndAddButton(
                    product: product,
                    deviceWidth: deviceWidth,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
