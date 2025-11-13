import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import 'profile_image.dart';
import 'profile_information_row.dart';
import 'profile_logout_button.dart';
import 'profile_person_name.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة البروفايل + الاسم + زر تعديل
              const SizedBox(height: 8),
              ProfileImage(),
              const SizedBox(height: 16),
              ProfilePersonName(),

              const SizedBox(height: 24),

              // عنوان Settings
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: AppStyles.textInter16.copyWith(
                    fontSize: 18,
                    color: AppColors.bgBlack,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // عناصر الإعدادات
              ProfileInformationRow(
                icon: Icons.phone_outlined,
                title: '+380483746375',
                onEdit: () {},
              ),
              const SizedBox(height: 20),
              ProfileInformationRow(
                icon: Icons.location_on_rounded,
                title: 'Ukraine, Ivano-Frankivsk, Kon…',
                onEdit: () {},
              ),
              const SizedBox(height: 20),
              ProfileInformationRow(
                icon: Icons.add_shopping_cart_rounded,
                title: 'My Cart',
                onEdit: () {},
              ),

              const SizedBox(height: 36),

              // زر تسجيل الخروج (نصي + أيقونة)
              ProfileLogoutButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
