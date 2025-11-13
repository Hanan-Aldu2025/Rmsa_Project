import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_state.dart';
import 'package:appp/featurees/main_screens/home/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_list_view.dart';
import 'empty_favorites_widget.dart';

class FavoritesViewBody extends StatelessWidget {
  // final String uid;
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final paddingH = width * 0.04;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: 8),
        child: Column(
          children: [
            AppSearchField(onChanged: cubit.searchFavorites),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.products.isEmpty) {
                    return const EmptyFavoritesWidget();
                  }
                  return FavoritesListView(
                    products: state.products,
                    quantities: state.quantities,
                    cubit: cubit,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
