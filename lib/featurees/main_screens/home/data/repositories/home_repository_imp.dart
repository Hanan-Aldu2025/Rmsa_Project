import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/branch_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeReposImp extends HomeRepos {
  final HomeRemoteDataSource remoteDataSource;

  HomeReposImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BranchModel>>> fetchBranches() async {
    try {
      final branches = await remoteDataSource.getBranches();
      return right(branches);
    } catch (e) {
      return left(FailureServer("حدث خطأ أثناء جلب الفروع: $e"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategoriesForBranch(
    String branchId,
  ) async {
    try {
      final categories = await remoteDataSource.getCategories(branchId);
      return right(categories);
    } catch (e) {
      return left(FailureServer("حدث خطأ أثناء جلب التصنيفات: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts({
    required String branchId,
    String? categoryId,
  }) async {
    try {
      final products = await remoteDataSource.getProducts(
        branchId,
        categoryId: categoryId,
      );
      return right(products);
    } catch (e) {
      return left(FailureServer("حدث خطأ أثناء جلب المنتجات: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts({
    required String branchId,
    required String queryText,
  }) async {
    try {
      final products = await remoteDataSource.searchProducts(
        branchId,
        queryText,
      );
      return right(products);
    } catch (e) {
      return left(FailureServer("حدث خطأ أثناء البحث عن المنتجات: $e"));
    }
  }
}
