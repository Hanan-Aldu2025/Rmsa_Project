// views/home_view_body.dart
import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:appp/utils/app_style.dart';

import 'home_category_list_view.dart';
import 'home_product_list_view.dart';
import 'home_view_header.dart';
import 'home_view_search.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            HomeViewHeader(),
            //search
            HomeViewSearch(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Categories', style: AppStyles.styleBold20),
            ),
            //CategoryListViewItem
            HomeCategoryListView(),
            //ProductListViewItem
            Expanded(child: HomeProductListView()),
          ],
        ),
      ),
    );
  }
}
