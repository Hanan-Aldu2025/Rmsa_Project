import 'package:appp/featurees/main_screens/bottom_nav_view/presentation/widgets/bottom_nav_bar.dart';
import 'package:appp/featurees/main_screens/favorite/data/datasources/favorites_remote_data_source.dart';
import 'package:appp/featurees/main_screens/favorite/domain/repositories/favorites_repositories_imp.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/widgets/favorites_view_body.dart';
import 'package:appp/featurees/main_screens/home/presentation/cubit/home_cubit.dart';
import 'package:appp/featurees/main_screens/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/cubit/bottom_nav_cubit.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});
  static const routeName = "BottomNavView";

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    /// الصفحات (مرتبطة بالـ IndexStack للحفاظ على الحالة)
    final pages = [
      HomeView(uid: uid),
      const FavoritesViewBody(),
      const Center(child: Text('Orders')),
      const Center(child: Text('Location')),
      const Center(child: Text('Profile')),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(
          create: (context) => FavoritesCubit(
            repository: FavoritesRepositoryImpl(
              remoteDataSource: FavoritesRemoteDataSource(),
            ),
            homeCubit: context.read<HomeCubit>(),
            uid: uid,
          ),
        ),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(index: currentIndex, children: pages),
            bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
          );
        },
      ),
    );
  }
}
