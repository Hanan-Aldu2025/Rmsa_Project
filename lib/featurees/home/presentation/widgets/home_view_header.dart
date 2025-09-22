import 'package:flutter/material.dart';

import '../../../../utils/app_style.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.location_on, size: 18),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Ukraine, Ivano-Frankivsk, Konovaltsya 132',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleExtraBold12,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.phone_outlined, size: 20),
        ),
      ],
    );
  }
}
