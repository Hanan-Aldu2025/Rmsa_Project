import 'package:appp/core/app.dart';
import 'package:appp/featurees/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class LanguageSelectionView extends StatelessWidget {
  static const String routeName = "/languageSelection";

  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHorizontal = size.width * 0.1; // 10% من عرض الشاشة
    final spacingVertical = size.height * 0.02; // 2% من ارتفاع الشاشة

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "اختر اللغة   ",
              style: AppStyles.styleMedium20.copyWith(color: Colors.black),
            ),
            Text(
              "   Choose Language",
              style: AppStyles.styleMedium20.copyWith(color: Colors.black),
            ),
            SizedBox(height: spacingVertical),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppBootstrap.setLocale(context, const Locale("en"));
                  Navigator.pushReplacementNamed(
                    context,
                    OnBoardingView.routeName,
                  );
                },
                child: Text(
                  "English",
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
              ),
            ),
            SizedBox(height: spacingVertical),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppBootstrap.setLocale(context, const Locale("ar"));
                  Navigator.pushReplacementNamed(
                    context,
                    OnBoardingView.routeName,
                  );
                },
                child: Text(
                  "العربية",
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
