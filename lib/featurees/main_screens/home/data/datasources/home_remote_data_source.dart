// 📁 data/datasources/home_remote_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/branch_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSource({FirebaseFirestore? firestoreInstance})
    : firestore = firestoreInstance ?? FirebaseFirestore.instance;

  Future<List<BranchModel>> getBranches() async {
    final snap = await firestore.collection('branches').get();
    return snap.docs.map((d) => BranchModel.fromDoc(d)).toList();
  }

  Future<List<CategoryModel>> getCategories(String branchId) async {
    final snap = await firestore
        .collection('categories')
        .where('branchIds', arrayContains: branchId)
        .get();
    return snap.docs.map((d) => CategoryModel.fromDoc(d)).toList();
  }

  Future<List<ProductModel>> getProducts(
    String branchId, {
    String? categoryId,
  }) async {
    Query query = firestore
        .collection('products')
        .where('branchIds', arrayContains: branchId)
        .where('isAvaliable', isEqualTo: true);

    if (categoryId != null && categoryId.isNotEmpty && categoryId != 'all') {
      query = query.where('categoryId', isEqualTo: categoryId);
    }

    final snap = await query.get();
    return snap.docs.map((d) => ProductModel.fromDoc(d)).toList();
  }

  Future<List<ProductModel>> searchProducts(
    String branchId,
    String queryText,
  ) async {
    final snap = await firestore
        .collection('products')
        .where('branchIds', arrayContains: branchId)
        .where('isAvaliable', isEqualTo: true)
        .get();

    final all = snap.docs.map((d) => ProductModel.fromDoc(d)).toList();
    final query = queryText.toLowerCase();
    return all.where((p) => p.name.toLowerCase().contains(query)).toList();
  }
}
