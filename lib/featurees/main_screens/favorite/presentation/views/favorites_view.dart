import 'package:appp/featurees/main_screens/favorite/domain/repositories/favorites_repositories_imp.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/widgets/favorites_body_bloc_consumer.dart';
import 'package:appp/featurees/main_screens/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/favorites_remote_data_source.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  final String uid;
  const FavoritesView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final dataSource = FavoritesRemoteDataSource();
    final repo = FavoritesRepositoryImpl(remoteDataSource: dataSource);

    return BlocProvider(
      create: (_) =>
          FavoritesCubit(repository: repo, homeCubit: homeCubit, uid: uid),
      child: SafeArea(child: FavoritesBodyBlocConsumer()),
    );
  }
}
