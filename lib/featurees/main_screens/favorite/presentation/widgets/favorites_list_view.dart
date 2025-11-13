import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/widgets/favorites_item_card.dart';
import 'package:appp/featurees/main_screens/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoritesListView extends StatelessWidget {
  final List<ProductModel> products;
  final Map<String, int> quantities;
  final FavoritesCubit cubit;

  const FavoritesListView({
    super.key,
    required this.products,
    required this.quantities,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        final quantity = quantities[p.id] ?? 1;
        return FavoriteItemCard(
          product: p,
          quantity: quantity,
          onIncrease: () => cubit.increaseQuantity(p.id),
          onDecrease: () => cubit.decreaseQuantity(p.id),
        );
      },
    );
  }
}
