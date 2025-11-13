import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/app_colors.dart';
import '../../data/models/product_model.dart';

class CustomProductImageandFavoriteIcon extends StatelessWidget {
  const CustomProductImageandFavoriteIcon({
    super.key,
    required this.p,
    required this.uid,
  });

  final ProductModel p;
  final String uid; // المستخدم الحالي

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: p.imageUrl.isNotEmpty
              ? Image.network(
                  p.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(height: 120, color: AppColors.whiteColor),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: GestureDetector(
            onTap: () {
              context.read<FavoritesCubit>().toggleFavorite(p);
            },
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                final isFavorite = state.favorites.any(
                  (f) => f.productId == p.id,
                );
                return Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 23,
                  color: isFavorite ? Colors.red : AppColors.softGray,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
