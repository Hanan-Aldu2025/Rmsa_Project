import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_state.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/widgets/favorites_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FavoritesBodyBlocConsumer extends StatelessWidget {
  const FavoritesBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return FavoritesViewBody();
      },
    );
  }
}
