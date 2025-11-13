import 'dart:async';

import 'package:appp/featurees/main_screens/favorite/data/repositories/favorites_repositories.dart';
import 'package:appp/featurees/main_screens/favorite/presentation/cubit/favorite_state.dart';
import 'package:appp/featurees/main_screens/home/data/models/product_model.dart';
import 'package:appp/featurees/main_screens/home/presentation/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import '../../data/models/favorite_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository repository;
  final HomeCubit homeCubit;
  late final StreamSubscription homeSub;
  final String uid;

  FavoritesCubit({
    required this.repository,
    required this.homeCubit,
    required this.uid,
  }) : super(const FavoritesState()) {
    // الاستماع لتغير الفرع في HomeCubit
    homeSub = homeCubit.stream.listen((homeState) {
      final selectedBranchId = homeState.selectedBranch?.id ?? '';
      if (selectedBranchId.isNotEmpty) {
        loadFavorites(); // إعادة تحميل المفضلة حسب الفرع الجديد
      }
    });

    // التحميل الأولي
    loadFavorites();
  }

  @override
  Future<void> close() {
    homeSub.cancel();
    return super.close();
  }

  Future<void> loadFavorites() async {
    emit(state.copyWith(loading: true));

    final selectedBranchId = homeCubit.state.selectedBranch?.id ?? '';
    if (selectedBranchId.isEmpty) {
      emit(state.copyWith(loading: false, errorMessage: "No branch selected"));
      return;
    }

    final favResult = await repository.fetchFavorites(uid);

    favResult.fold(
      (failure) => emit(
        state.copyWith(loading: false, errorMessage: failure.errorMessage),
      ),
      (favList) async {
        List<ProductModel> products = [];
        for (var fav in favList) {
          final snap = await FirebaseFirestore.instance
              .collection('products')
              .doc(fav.productId)
              .get();

          if (snap.exists) {
            final product = ProductModel.fromDoc(snap);

            // فلترة حسب الفرع الحالي
            if (product.branchIds.contains(selectedBranchId)) {
              products.add(product);
            }
          }
        }

        emit(
          state.copyWith(
            favorites: favList,
            products: products,
            allProducts: products,
            loading: false,
          ),
        );
      },
    );
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final currentFavorites = List<FavoriteModel>.from(state.favorites);

    final existing = currentFavorites.firstWhereOrNull(
      (f) => f.productId == product.id,
    );

    List<FavoriteModel> updatedFavorites;
    if (existing != null) {
      updatedFavorites = currentFavorites
          .where((f) => f.productId != product.id)
          .toList();
    } else {
      updatedFavorites = [
        ...currentFavorites,
        FavoriteModel(
          id: 'temp_${product.id}',
          productId: product.id,
          addedAt: DateTime.now(),
        ),
      ];
    }

    emit(state.copyWith(favorites: updatedFavorites));

    try {
      if (existing != null) {
        await repository.removeFavorite(uid, existing.id);
      } else {
        await repository.addFavorite(uid, product.id);
      }
      await loadFavorites(); // إعادة تحميل بعد التغيير الحقيقي
    } catch (_) {
      emit(state.copyWith(favorites: currentFavorites));
    }
  }

  void searchFavorites(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(products: state.allProducts));
      return;
    }

    final filtered = state.allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(products: filtered));
  }

  void increaseQuantity(String productId) {
    final newQuantities = Map<String, int>.from(state.quantities);
    newQuantities[productId] = (newQuantities[productId] ?? 1) + 1;
    emit(state.copyWith(quantities: newQuantities));
  }

  void decreaseQuantity(String productId) {
    final newQuantities = Map<String, int>.from(state.quantities);
    final current = newQuantities[productId] ?? 1;
    if (current > 1) newQuantities[productId] = current - 1;
    emit(state.copyWith(quantities: newQuantities));
  }
}
