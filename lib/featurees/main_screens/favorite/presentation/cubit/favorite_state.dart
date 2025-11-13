import 'package:appp/featurees/main_screens/home/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/favorite_model.dart';

class FavoritesState extends Equatable {
  final List<FavoriteModel> favorites;
  final List<ProductModel> products;
  final List<ProductModel> allProducts; // ✅ نسخة كاملة
  final bool loading;
  final String? errorMessage;
  final Map<String, int> quantities;

  const FavoritesState({
    this.favorites = const [],
    this.products = const [],
    this.allProducts = const [], // ✅ التهيئة
    this.loading = false,
    this.errorMessage,
    this.quantities = const {},
  });

  FavoritesState copyWith({
    List<FavoriteModel>? favorites,
    List<ProductModel>? products,
    List<ProductModel>? allProducts, // ✅ copyWith
    bool? loading,
    String? errorMessage,
    Map<String, int>? quantities,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts, // ✅ copyWith
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      quantities: quantities ?? this.quantities,
    );
  }

  @override
  List<Object?> get props => [
    favorites,
    products,
    allProducts, // ✅ إضافة
    loading,
    errorMessage,
    quantities,
  ];
}

// class FavoritesState extends Equatable {
//   final List<FavoriteModel> favorites;
//   final List<ProductModel> products;
//   final bool loading;
//   final String? errorMessage;
//   final Map<String, int> quantities;

//   const FavoritesState({
//     this.favorites = const [],
//     this.products = const [],
//     this.loading = false,
//     this.errorMessage,
//     this.quantities = const {},
//   });

//   FavoritesState copyWith({
//     List<FavoriteModel>? favorites,
//     List<ProductModel>? products,
//     bool? loading,
//     String? errorMessage,
//     Map<String, int>? quantities,
//   }) {
//     return FavoritesState(
//       favorites: favorites ?? this.favorites,
//       products: products ?? this.products,
//       loading: loading ?? this.loading,
//       errorMessage: errorMessage ?? this.errorMessage,
//       quantities: quantities ?? this.quantities,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     favorites,
//     products,
//     loading,
//     errorMessage,
//     quantities,
//   ];
// }
