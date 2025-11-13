import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';
import '../../data/models/branch_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class BranchSelectorDropdown extends StatelessWidget {
  const BranchSelectorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final branches = state.branches;
        final selected = state.selectedBranch;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.backGray,
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  LucideIcons.mapPin,
                  color: AppColors.iconColorDark,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 10,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<BranchModel>(
                    isExpanded: true,
                    value: selected,
                    hint: const Text("Select Branch"),
                    dropdownColor: AppColors.whiteColor,
                    items: branches.map((b) {
                      final isOnline = b.status == 'online';
                      return DropdownMenuItem(
                        value: b,
                        child: Text(
                          b.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textInter14Gray.copyWith(
                            color: isOnline ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    selectedItemBuilder: (context) => branches.map((b) {
                      final isSelected = selected?.id == b.id;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          b.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textInter14Gray.copyWith(
                            color: isSelected
                                ? (b.status == 'online'
                                      ? Colors.green
                                      : Colors.red)
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),

                    onChanged: (b) {
                      if (b != null) {
                        context.read<HomeCubit>().selectBranch(b);
                      }
                    },

                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.iconColorDark,
                    ),
                  ),
                ),
              ),
              Expanded(child: const SizedBox()),
              TextButton(
                onPressed: () {},
                child: Icon(
                  LucideIcons.phoneCall,
                  // Icons.phone_in_talk_sharp,
                  size: 16,
                  color: selected?.status == 'online'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
