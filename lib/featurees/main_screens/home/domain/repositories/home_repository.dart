import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../data/models/branch_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/product_model.dart';

abstract class HomeRepos {
  Future<Either<Failure, List<BranchModel>>> fetchBranches();
  Future<Either<Failure, List<CategoryModel>>> fetchCategoriesForBranch(
    String branchId,
  );
  Future<Either<Failure, List<ProductModel>>> fetchProducts({
    required String branchId,
    String? categoryId,
  });
  Future<Either<Failure, List<ProductModel>>> searchProducts({
    required String branchId,
    required String queryText,
  });
}
