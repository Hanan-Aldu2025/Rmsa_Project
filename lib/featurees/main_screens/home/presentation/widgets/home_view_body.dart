import 'package:appp/featurees/main_screens/home/app_search_field.dart';
import 'package:appp/featurees/main_screens/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants/constans_kword.dart';
import 'branch_selector_dropdown.dart';
import 'category_list_view.dart';
import 'home_app_bar.dart';
import 'home_section_title.dart';
import 'product_grid_view_item.dart';

class HomeViewBody extends StatelessWidget {
  final String uid;
  const HomeViewBody({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(title: 'Ramsa Cafe'),
          const BranchSelectorDropdown(),
          AppSearchField(
            controller: cubit.searchController,
            hintText: "Search for coffee or treats...",
            onChanged: cubit.search,
          ),
          const HomeSectionTitle(title: 'Explore Categories'),
          const CategoryListView(),
          const SizedBox(height: 5),
          const HomeSectionTitle(title: 'Featured Drinks'),
          Expanded(child: ProductGridViewItem(uid: uid)),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

// class HomeViewBody extends StatelessWidget {
//   final String uid;
//   const HomeViewBody({super.key, required this.uid});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const HomeAppBar(title: 'Ramsa Cafe'),
//           const BranchSelectorDropdown(),
//           AppSearchField(
//             hintText: "Search for coffee or treats...",
//             onChanged: (value) {
//               context.read<HomeCubit>().search(value);
//             },
//           ),
//           const HomeSectionTitle(title: 'Explore Categories'),
//           const CategoryListView(),
//           const SizedBox(height: 5),
//           const HomeSectionTitle(title: 'Featured Drinks'),
//           Expanded(child: ProductGridViewItem(uid: uid)),
//           const SizedBox(height: 15),
//         ],
//       ),
//     );
//   }
// }
