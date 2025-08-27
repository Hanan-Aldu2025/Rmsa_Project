import 'package:appp/constans.dart';
import 'package:appp/core/services/shared_preverences_singleton.dart';
import 'package:appp/core/widget/custom_button.dart';
import 'package:appp/featurees/longin/presentation/views/login_view.dart';
import 'package:appp/featurees/on_boarding/presentation/widget/on_boarding_page_view.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBordingViewBody extends StatefulWidget {
  //  final bool isVisible;
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: OnBoardingPageView(pageController: pageController),
          ),
          //___________________________________________________//
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    color: AppColors.bgorangLight,
                    activeColor: AppColors.dotactive,
                  ),
                ),
                SizedBox(height: 16),
                Visibility(
                  visible: currentPage == 2 ? true : false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CustomButton(
                    passward: () async {
                      await AppPrefs.setBool(kIsOnBoardingVieweSeen, true);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routeName);
                    },
                    text: "Start ",
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
