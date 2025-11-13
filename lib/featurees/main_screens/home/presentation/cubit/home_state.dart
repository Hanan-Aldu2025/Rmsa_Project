import 'package:equatable/equatable.dart';
import '../../data/models/branch_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/product_model.dart';

class HomeState extends Equatable {
  final List<BranchModel> branches;
  final BranchModel? selectedBranch;
  final List<CategoryModel> categories;
  final String selectedCategoryId;
  final List<ProductModel> products;
  final bool loading;
  final String searchQuery;
  final String? errorMessage; // ✅ مضافة لمعالجة الأخطاء

  const HomeState({
    this.branches = const [],
    this.selectedBranch,
    this.categories = const [],
    this.selectedCategoryId = 'all',
    this.products = const [],
    this.loading = false,
    this.searchQuery = '',
    this.errorMessage, // ✅
  });

  HomeState copyWith({
    List<BranchModel>? branches,
    BranchModel? selectedBranch,
    List<CategoryModel>? categories,
    String? selectedCategoryId,
    List<ProductModel>? products,
    bool? loading,
    String? searchQuery,
    String? errorMessage, // ✅
  }) {
    return HomeState(
      branches: branches ?? this.branches,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      products: products ?? this.products,
      loading: loading ?? this.loading,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage, // ✅
    );
  }

  @override
  List<Object?> get props => [
    branches,
    selectedBranch,
    categories,
    selectedCategoryId,
    products,
    loading,
    searchQuery,
    errorMessage, // ✅ حتى يأخذها Equatable في المقارنة
  ];
}
