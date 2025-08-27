import 'package:appp/featurees/dassh_bord/presentation/views/dash_bord.dart';
import 'package:appp/featurees/language/presentation/views/language_selection_view.dart';
import 'package:appp/featurees/longin/presentation/views/login_view.dart';
import 'package:appp/featurees/mobile_app/presentation/views/mobile.dart';
import 'package:appp/featurees/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:appp/featurees/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //____________________________________________________________

      case DashBorad.routeName:
        return MaterialPageRoute(builder: (_) => const DashBorad());

      //____________________________________________________________
      case MobileApp.routeName:
        return MaterialPageRoute(builder: (_) => const MobileApp());
      //____________________________________________________________

      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      //____________________________________________________________
        case LanguageSelectionView.routeName:
        return MaterialPageRoute(builder: (_) => const LanguageSelectionView());
      //____________________________________________________________

      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      //____________________________________________________________
      
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());


      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
