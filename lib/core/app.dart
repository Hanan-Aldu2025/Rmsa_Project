import 'package:appp/core/helper_fauniction/on_generate_router.dart';
import 'package:appp/featurees/dassh_bord/presentation/views/dash_bord.dart';
import 'package:appp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("en"),
      debugShowCheckedModeBanner: false,
      title: 'Rmsa Cafe',
      theme: ThemeData(fontFamily: "Montserrat"),
      initialRoute: DashBorad.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
