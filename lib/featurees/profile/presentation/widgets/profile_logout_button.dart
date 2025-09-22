import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topRight,
      child: InkWell(
        onTap: () {},
        child: Wrap(
          children: [
            Text(
              'Logout',
              style: AppStyles.styleBold15.copyWith(
                color: AppColors.bgBrownLight,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.logout, color: AppColors.bgBrownLight),
          ],
        ),
      ),
    );
  }
}
