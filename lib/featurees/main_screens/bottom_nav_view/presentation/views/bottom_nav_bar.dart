import 'package:appp/featurees/main_screens/bottom_nav_view/presentation/cubit/bottom_nav_cubit.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: const Border(
          top: BorderSide(color: Color(0xFFA6A6A7), width: 1),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
        selectedLabelStyle: AppStyles.textInter14Gray.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: AppStyles.textInter14Gray,
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.iconColorDark,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart, size: 24),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.package, size: 24),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.mapPin, size: 24),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user, size: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
