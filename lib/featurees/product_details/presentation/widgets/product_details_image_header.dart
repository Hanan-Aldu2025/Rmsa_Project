import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';

class ProductDetailsImageHeader extends StatelessWidget {
  const ProductDetailsImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(SvgImages.imagesCappuccino),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
