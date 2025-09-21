import 'package:appp/core/services/firebase_auth_services.dart';
import 'package:appp/featurees/Auth/data/repos/auth_repos_imp.dart';
import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Firebase Service
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  // Auth repo
  getIt.registerSingleton<AuthRepos>(
    AuthReposImp(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
