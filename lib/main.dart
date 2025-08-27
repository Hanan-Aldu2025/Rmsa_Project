import 'package:appp/core/app.dart';
import 'package:appp/core/services/shared_preverences_singleton.dart';
import 'package:appp/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs.init();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SplashViewModel())],
      child: const AppBootstrap(),
    ),
  );
}
