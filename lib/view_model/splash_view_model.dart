// lib/features/splash/viewmodel/splash_vm.dart
import 'package:appp/constans.dart';
import 'package:appp/core/services/shared_preverences_singleton.dart';
import 'package:appp/featurees/language/presentation/views/language_selection_view.dart';
import 'package:appp/featurees/longin/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  double _opacity = 0.0;
  double get opacity => _opacity;

  String appName = "RMSA Café";
  String slogan = "Taste the Moments ☕";

  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _opacity = 1.0;
      notifyListeners();
    });
  }

  Future<void> initSplash(BuildContext context) async {
    startAnimation();
    bool isOnBoardingVieweSeen = AppPrefs.getBool(kIsOnBoardingVieweSeen);
    await Future.delayed(const Duration(seconds: 4));
    if (isOnBoardingVieweSeen) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LanguageSelectionView()),
      );
    }
  }
}
