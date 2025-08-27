import 'package:appp/featurees/on_boarding/presentation/widget/on_boarding_items.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingItems(
          title: "Sip, Savor, Smile – Your Coffee Moment Awaits!",
          backgroundimage: Assets.imagesOneboarding,
          bkgroundcolor: AppColors.bgBlack,
        ),
        OnBoardingItems(
          title: "Wake Up to Happiness – Coffee and Desserts Together",
          backgroundimage: Assets.imagesTwoboarding,
          bkgroundcolor: AppColors.bgBrownDark,
        ),
        OnBoardingItems(
          title:
              "Enjoy every sip and every bite, where coffee and sweets turn into unforgettable moments",
          backgroundimage: Assets.imagesThreeboarding,
          bkgroundcolor: AppColors.bgBrownLight,
        ),
      ],
    );
  }
}
