import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 52,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: const NetworkImage(
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400',
      ),
    );
  }
}
