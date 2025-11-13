import 'package:appp/core/services/shared_preverences_singleton.dart';
import 'package:appp/featurees/main_screens/home/data/models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepos repository;
  final TextEditingController searchController = TextEditingController();

  HomeCubit({required this.repository}) : super(const HomeState());

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  /// تحميل البيانات الأولية
  Future<void> loadInitialData() async {
    emit(state.copyWith(loading: true));

    final branchesResult = await repository.fetchBranches();
    final branches = branchesResult.fold((failure) {
      emit(state.copyWith(loading: false, errorMessage: failure.errorMessage));
      return <BranchModel>[];
    }, (data) => data);

    if (branches.isEmpty) return;

    // استرجاع الفرع المختار سابقًا من AppPrefs
    final savedBranchId = AppPrefs.getString('selectedBranchId');

    BranchModel selected;
    if (savedBranchId.isNotEmpty) {
      selected = branches.firstWhere(
        (b) => b.id == savedBranchId,
        orElse: () => branches.first,
      );
    } else {
      selected = branches.first;
    }

    final categoriesResult = await repository.fetchCategoriesForBranch(
      selected.id,
    );
    final productsResult = await repository.fetchProducts(
      branchId: selected.id,
    );

    final categories = categoriesResult.getOrElse(() => []);
    final products = productsResult.getOrElse(() => []);
    products.shuffle();

    emit(
      state.copyWith(
        branches: branches,
        selectedBranch: selected,
        categories: categories,
        products: products,
        loading: false,
        selectedCategoryId: 'all',
      ),
    );
  }

  /// اختيار فرع محدد
  Future<void> selectBranch(BranchModel branch) async {
    emit(
      state.copyWith(
        loading: true,
        selectedBranch: branch,
        selectedCategoryId: 'all',
        searchQuery: '',
      ),
    );

    // حفظ الفرع المختار في AppPrefs
    await AppPrefs.setString('selectedBranchId', branch.id);

    final categoriesResult = await repository.fetchCategoriesForBranch(
      branch.id,
    );
    final productsResult = await repository.fetchProducts(branchId: branch.id);

    final categories = categoriesResult.getOrElse(() => []);
    final products = productsResult.getOrElse(() => []);
    products.shuffle();

    emit(
      state.copyWith(
        categories: categories,
        products: products,
        loading: false,
      ),
    );
  }

  /// اختيار فئة معينة
  Future<void> selectCategory(String categoryId) async {
    if (state.selectedBranch == null) return;

    emit(
      state.copyWith(
        loading: true,
        selectedCategoryId: categoryId,
        searchQuery: '',
      ),
    );

    final productsResult = await repository.fetchProducts(
      branchId: state.selectedBranch!.id,
      categoryId: categoryId == 'all' ? null : categoryId,
    );

    final products = productsResult.getOrElse(() => []);
    emit(state.copyWith(products: products, loading: false));
  }

  /// البحث
  Future<void> search(String query) async {
    if (state.selectedBranch == null) return;

    emit(state.copyWith(loading: true, searchQuery: query));

    if (query.trim().isEmpty) {
      await selectCategory(state.selectedCategoryId);
      return;
    }

    final result = await repository.searchProducts(
      branchId: state.selectedBranch!.id,
      queryText: query,
    );

    final products = result.getOrElse(() => []);
    emit(state.copyWith(products: products, loading: false));
  }
}
