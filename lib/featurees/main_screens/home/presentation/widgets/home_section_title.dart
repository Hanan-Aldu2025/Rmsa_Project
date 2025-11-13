import 'package:flutter/material.dart';

import '../../../../../utils/app_style.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  const HomeSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Text(title, style: AppStyles.titleLora18),
    );
  }
}
