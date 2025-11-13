import 'package:appp/core/helper_fauniction/on_generate_router.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/views/login_view.dart';
import 'package:appp/generated/l10n.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({super.key});

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _AppBootstrapState? state = context
        .findAncestorStateOfType<_AppBootstrapState>();
    state?.setLocale(newLocale);
  }
}

class _AppBootstrapState extends State<AppBootstrap> {
  Locale _locale = const Locale("en");
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  } // البداية

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        //     supportedLocales: S.delegate.supportedLocales,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Rmsa Cafe',
      theme: ThemeData(
        // fontFamily: "Montserrat",
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bgBrownDark),
      ),
      initialRoute: LoginView.routeName,
      // home: BottomNavView(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
