import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No favourites found',
        style: AppStyles.titleLora18.copyWith(color: AppColors.iconColorlight),
      ),
    );
  }
}
