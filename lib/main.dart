import 'package:appp/core/app.dart';
import 'package:appp/core/services/custom_bloc_observer.dart';
import 'package:appp/core/services/get_it_services.dart';
import 'package:appp/core/services/shared_preverences_singleton.dart';
import 'package:appp/featurees/main_screens/home/data/datasources/home_remote_data_source.dart';
import 'package:appp/featurees/main_screens/home/data/repositories/home_repository_imp.dart';
import 'package:appp/featurees/main_screens/home/presentation/cubit/home_cubit.dart';
import 'package:appp/view_model/splash_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs.init();
  await Firebase.initializeApp();
  setupGetIt();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        BlocProvider(
          create: (_) {
            final dataSource = HomeRemoteDataSource();
            final repository = HomeReposImp(remoteDataSource: dataSource);
            final cubit = HomeCubit(repository: repository);
            cubit.loadInitialData(); // يتم تحميل البيانات مرة واحدة فقط
            return cubit;
          },
        ),
      ],
      child: const AppBootstrap(),
    ),
  );
  // runApp(
  //   MultiProvider(
  //     providers: [ChangeNotifierProvider(create: (_) => SplashViewModel())],
  //     child: const AppBootstrap(),
  //   ),
  // );
}
