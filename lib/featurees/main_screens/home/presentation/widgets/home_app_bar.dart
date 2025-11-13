import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_style.dart';

class HomeAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onNotificationPressed;

  const HomeAppBar({
    super.key,
    required this.title,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Text('Ramsa Cafe', style: AppStyles.titleLora18)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 70),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: AppColors.bgBlack,
                      size: 25,
                    ),
                    onPressed: onNotificationPressed,
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.6e0b5423974c1843e2d865960e405845?rik=q0UICCR9pjgnOQ&riu=http%3a%2f%2fgetdrawings.com%2ffree-icon-bw%2finstagram-no-profile-picture-icon-22.png&ehk=b6DdDoEpDYs0F4UQ1PpFCHJZZQQj1CPOfUlkeD9BkiI%3d&risl=&pid=ImgRaw&r=0',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
