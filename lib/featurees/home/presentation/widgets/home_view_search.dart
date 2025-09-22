import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class HomeViewSearch extends StatelessWidget {
  const HomeViewSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        style: AppStyles.styleRegular14.copyWith(color: AppColors.bgBlack),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: AppStyles.styleRegular14.copyWith(color: AppColors.bgGrey),
          prefixIcon:  Icon(
            FontAwesomeIcons.search,
            //magnifyingGlass,
            size: 17,
            color: AppColors.bgGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.bgGreyLight,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
