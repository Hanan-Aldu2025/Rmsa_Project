import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cats = state.categories;
        final selected = state.selectedCategoryId;
        final items = [
          {'id': 'all', 'name': 'All'},
        ]..addAll(cats.map((c) => {'id': c.id, 'name': c.name}));

        return SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = items[index];
              final bool isSelected = item['id'] == selected;
              return GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().selectCategory(
                    item['id'] as String,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.backGray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? Colors.transparent
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item['name'] as String == 'All'
                            ? LucideIcons.layers
                            : item['name'] as String == 'Caffee'
                            ? LucideIcons.coffee
                            : item['name'] as String == 'dessert'
                            ? LucideIcons.cake
                            // ? Icons.emoji_nature
                            : LucideIcons.leaf,
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item['name'] as String,
                        style: AppStyles.textInter14Gray.copyWith(
                          color: isSelected
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
