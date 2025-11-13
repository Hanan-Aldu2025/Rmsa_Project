import 'package:appp/core/error/failure.dart';
import 'package:appp/featurees/main_screens/favorite/data/repositories/favorites_repositories.dart';
import 'package:appp/featurees/main_screens/home/data/models/product_model.dart';
import 'package:appp/featurees/main_screens/home/domain/repositories/home_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';

class FavoriteModel {
  final String id;
  final String productId;
  final DateTime addedAt;

  FavoriteModel({
    required this.id,
    required this.productId,
    required this.addedAt,
  });

  factory FavoriteModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FavoriteModel(
      id: doc.id,
      productId: data['productId'] ?? '',
      addedAt: (data['addedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'productId': productId, 'addedAt': Timestamp.fromDate(addedAt)};
  }
}

// class FavoritesRemoteDataSource {
//   final FirebaseFirestore firestore;

//   FavoritesRemoteDataSource({FirebaseFirestore? firestoreInstance})
//     : firestore = firestoreInstance ?? FirebaseFirestore.instance;

//   Future<List<FavoriteModel>> getFavorites(String uid) async {
//     final snap = await firestore
//         .collection('users')
//         .doc(uid)
//         .collection('favorites')
//         .get();
//     return snap.docs.map((d) => FavoriteModel.fromDoc(d)).toList();
//   }

//   Future<void> addFavorite(String uid, String productId) async {
//     await firestore.collection('users').doc(uid).collection('favorites').add({
//       'productId': productId,
//       'addedAt': Timestamp.now(),
//     });
//   }

//   Future<void> removeFavorite(String uid, String favId) async {
//     await firestore
//         .collection('users')
//         .doc(uid)
//         .collection('favorites')
//         .doc(favId)
//         .delete();
//   }
// }

// abstract class FavoritesRepository {
//   Future<Either<Failure, List<FavoriteModel>>> fetchFavorites(String uid);
//   Future<Either<Failure, void>> addFavorite(String uid, String productId);
//   Future<Either<Failure, void>> removeFavorite(String uid, String favId);
// }

// class FavoritesRepositoryImpl extends FavoritesRepository {
//   final FavoritesRemoteDataSource remoteDataSource;

//   FavoritesRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, List<FavoriteModel>>> fetchFavorites(
//     String uid,
//   ) async {
//     try {
//       final data = await remoteDataSource.getFavorites(uid);
//       return right(data);
//     } catch (e) {
//       return left(FailureServer('حدث خطأ عند جلب المفضلات: $e'));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> addFavorite(
//     String uid,
//     String productId,
//   ) async {
//     try {
//       await remoteDataSource.addFavorite(uid, productId);
//       return right(null);
//     } catch (e) {
//       return left(FailureServer('حدث خطأ عند إضافة المفضلة: $e'));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> removeFavorite(String uid, String favId) async {
//     try {
//       await remoteDataSource.removeFavorite(uid, favId);
//       return right(null);
//     } catch (e) {
//       return left(FailureServer('حدث خطأ عند إزالة المفضلة: $e'));
//     }
//   }
// }

// class FavoritesCubit extends Cubit<FavoritesState> {
//   final FavoritesRepository repository;
//   final HomeRepos productRepository;

//   FavoritesCubit({required this.repository, required this.productRepository})
//     : super(const FavoritesState());

//   /// جلب المفضلات مع المنتجات المرتبطة
//   Future<void> loadFavorites(String uid) async {
//     emit(state.copyWith(loading: true));
//     final favResult = await repository.fetchFavorites(uid);

//     favResult.fold(
//       (failure) => emit(
//         state.copyWith(loading: false, errorMessage: failure.errorMessage),
//       ),
//       (favList) async {
//         List<ProductModel> products = [];

//         for (var fav in favList) {
//           final snap = await FirebaseFirestore.instance
//               .collection('products')
//               .doc(fav.productId)
//               .get();
//           if (snap.exists) {
//             products.add(ProductModel.fromDoc(snap));
//           }
//         }

//         emit(
//           state.copyWith(
//             favorites: favList,
//             products: products,
//             loading: false,
//           ),
//         );
//       },
//     );
//   }

//   /// إضافة / إزالة من المفضلات
//   Future<void> toggleFavorite(String uid, ProductModel product) async {
//     final existing = state.favorites.firstWhereOrNull(
//       (f) => f.productId == product.id,
//     );

//     if (existing != null) {
//       await repository.removeFavorite(uid, existing.id);
//     } else {
//       await repository.addFavorite(uid, product.id);
//     }

//     await loadFavorites(uid);
//   }

//   /// بحث داخل المنتجات المفضلة
//   void searchFavorites(String query) {
//     if (query.isEmpty) {
//       // عندما تكون خانة البحث فارغة نعيد تحميل القائمة الأصلية
//       emit(state.copyWith(products: List.from(state.products)));
//       loadFavorites(FirebaseAuth.instance.currentUser!.uid);
//       return;
//     }

//     final filtered = state.products
//         .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     emit(state.copyWith(products: filtered));
//   }

//   void increaseQuantity(String productId) {
//     final newQuantities = Map<String, int>.from(state.quantities);
//     newQuantities[productId] = (newQuantities[productId] ?? 1) + 1;
//     emit(state.copyWith(quantities: newQuantities));
//   }

//   void decreaseQuantity(String productId) {
//     final newQuantities = Map<String, int>.from(state.quantities);
//     final current = newQuantities[productId] ?? 1;
//     if (current > 1) newQuantities[productId] = current - 1;
//     emit(state.copyWith(quantities: newQuantities));
//   }
// }

// class FavoritesState extends Equatable {
//   final List<FavoriteModel> favorites;
//   final List<ProductModel> products;
//   final bool loading;
//   final String? errorMessage;
//   final Map<String, int> quantities; // 👈 جديد

//   const FavoritesState({
//     this.favorites = const [],
//     this.products = const [],
//     this.loading = false,
//     this.errorMessage,
//     this.quantities = const {}, // 👈 افتراضي
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

// class FavoritesViewBody extends StatelessWidget {
//   final String uid;

//   const FavoritesViewBody({super.key, required this.uid});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;

//     final paddingH = width * 0.04;
//     final imageSize = width * 0.18;
//     final fontTitle = width * 0.045;
//     final fontSubtitle = width * 0.038;
//     final iconSize = width * 0.045;
//     final buttonSize = width * 0.08; // حجم أزرار + و -

//     final cubit = context.read<FavoritesCubit>();

//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: 8),
//         child: Column(
//           children: [
//             // مربع البحث
//             Container(
//               height: height * 0.06,
//               padding: EdgeInsets.symmetric(horizontal: width * 0.03),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(width * 0.1),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: TextField(
//                 onChanged: cubit.searchFavorites,
//                 style: TextStyle(fontSize: fontSubtitle),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Search ..',
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: fontSubtitle,
//                   ),
//                   icon: Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                     size: iconSize + 2,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.02),

//             // قائمة المفضلات
//             Expanded(
//               child: BlocBuilder<FavoritesCubit, FavoritesState>(
//                 builder: (context, state) {
//                   if (state.loading) {
//                     return const Center(child: CircularProgressIndicator());
//                   }

//                   if (state.products.isEmpty) {
//                     return const Center(child: Text('No favourites found'));
//                   }

//                   return ListView.builder(
//                     itemCount: state.products.length,
//                     itemBuilder: (context, index) {
//                       final p = state.products[index];
//                       int quantity = 1; // العدد الافتراضي

//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: height * 0.01),
//                         padding: EdgeInsets.all(width * 0.025),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(width * 0.04),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.15),
//                               blurRadius: 8,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // صورة المنتج
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(width * 0.03),
//                               child: Image.network(
//                                 p.imageUrl,
//                                 width: imageSize,
//                                 height: imageSize,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             SizedBox(width: width * 0.035),

//                             // تفاصيل المنتج
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           p.name,
//                                           style: TextStyle(
//                                             fontSize: fontTitle,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: height * 0.004),
//                                   Text(
//                                     '${p.price}\$',
//                                     style: TextStyle(
//                                       fontSize: fontSubtitle,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),

//                             // SizedBox(width: width * 0.03),

//                             // أزرار + و - مع العدد
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 // زر -
//                                 InkWell(
//                                   onTap: () => cubit.decreaseQuantity(p.id),
//                                   child: Container(
//                                     width: buttonSize,
//                                     height: buttonSize,
//                                     decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.black,
//                                     ),
//                                     child: Icon(
//                                       Icons.remove,
//                                       size: iconSize,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: width * 0.015),

//                                 // العدد (من الـ Cubit)
//                                 Text(
//                                   (state.quantities[p.id] ?? 1).toString(),
//                                   style: TextStyle(
//                                     fontSize: fontSubtitle,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(width: width * 0.015),

//                                 // زر +
//                                 InkWell(
//                                   onTap: () => cubit.increaseQuantity(p.id),
//                                   child: Container(
//                                     width: buttonSize,
//                                     height: buttonSize,
//                                     decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.black,
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       size: iconSize,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
