import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/login_cubit/login_state.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepos) : super(LoginInitial());
  final AuthRepos authRepos;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepos.signInWithEmailAndPassword(email, password);
    result.fold(
      (Failure) => emit(LoginFailure(message: Failure.errorMessage)),
      (UserEntity) => emit(LoginSuccess(userEntity: UserEntity)),
    );
  }
}
