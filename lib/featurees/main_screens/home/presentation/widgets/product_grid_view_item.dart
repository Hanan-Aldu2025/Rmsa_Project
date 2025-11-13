import 'package:appp/featurees/main_screens/productdetails/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'add_to_cart_button.dart';
import 'custom_product_image_favorite.dart';

// class ProductGridViewItem extends StatelessWidget {
//   const ProductGridViewItem({super.key, required this.uid});
//   final String uid;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         if (state.loading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (state.products.isEmpty) {
//           return const Center(child: Text('لا توجد منتجات'));
//         }

//         final deviceWidth = MediaQuery.of(context).size.width;

//         // تحديد عدد الأعمدة بشكل مرن حسب عرض الشاشة
//         int crossAxisCount;
//         if (deviceWidth < 350) {
//           crossAxisCount = 2;
//         } else if (deviceWidth < 600) {
//           crossAxisCount = 2;
//         } else if (deviceWidth < 900) {
//           crossAxisCount = 3;
//         } else {
//           crossAxisCount = 4;
//         }

//         // تحديد نسبة العرض/الارتفاع للعناصر
//         double childAspectRatio = deviceWidth >= 350 ? 0.8 : 0.75;

//         return GridView.builder(
//           padding: const EdgeInsets.all(10),
//           itemCount: state.products.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxisCount,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             childAspectRatio: childAspectRatio,
//           ),
//           itemBuilder: (context, index) {
//             final product = state.products[index];
//             return Container(
//               decoration: BoxDecoration(
//                 color: AppColors.whiteColor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: AppColors.softGray),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomProductImageandFavoriteIcon(p: product, uid: uid),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 6),
//                     child: Text(product.name, style: AppStyles.textLora16),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 15,
//                       left: 10,
//                       bottom: 20,
//                     ),
//                     child: Text(
//                       "\$${product.price}",
//                       style: AppStyles.textInter14Gray,
//                     ),
//                   ),
//                   Center(
//                     child: AddToCartButton(
//                       text: "Add To Cart",
//                       product: product,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 ProductDetailsView(product: product),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class ProductGridViewItem extends StatelessWidget {
//   const ProductGridViewItem({super.key, required this.uid});
//   final String uid;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         if (state.loading)
//           return const Center(child: CircularProgressIndicator());
//         if (state.products.isEmpty)
//           return const Center(child: Text('لا توجد منتجات'));

//         return GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             childAspectRatio: 0.8,
//           ),
//           itemCount: state.products.length,
//           itemBuilder: (context, index) {
//             final product = state.products[index];
//             return Column(
//               children: [
//                 CustomProductImageandFavoriteIcon(p: product, uid: uid),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, top: 6),
//                   child: Text(product.name, style: AppStyles.textLora16),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
//                   child: Text(
//                     "\$${product.price}",
//                     style: AppStyles.textInter14Gray,
//                   ),
//                 ),
//                 Center(
//                   child: AddToCartButton(
//                     text: "Add To Cart",
//                     product: product,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => ProductDetailsView(product: product),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // const SizedBox(height: 5),
//                 // Text(product.name, style: AppStyles.textInter14Gray),
//                 // Text('\$${product.price}', style: AppStyles.textInter14Gray),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final products = state.products;
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        final deviceWidth = MediaQuery.of(context).size.width;
        final childAspectRatio = deviceWidth >= 250 && deviceWidth < 270
            ? 0.40
            : deviceWidth >= 270 && deviceWidth < 300
            ? 0.43
            : deviceWidth >= 300 && deviceWidth < 350
            ? 0.51
            : deviceWidth >= 350 && deviceWidth < 400
            ? 0.60
            : 0.65;
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

        return GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final p = products[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.softGray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image- Favorite
                    CustomProductImageandFavoriteIcon(p: p, uid: uid),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 6),
                      child: Text(p.name, style: AppStyles.textLora16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                        bottom: 20,
                      ),
                      child: Text(
                        "\$${p.price}",
                        style: AppStyles.textInter14Gray,
                      ),
                    ),
                    Center(
                      child: AddToCartButton(
                        text: "Add To Cart",
                        product: p,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsView(product: p),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
