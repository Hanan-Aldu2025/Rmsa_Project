import 'package:appp/featurees/Auth/domain/entity/user_entity.dart';
import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
//__________________________//

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepos) : super(SignupInitial());
  final AuthRepos authRepos;

  Future<void> createUserWithEmilAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());

    final result = await authRepos.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failure) => emit(SignupFailure(message: failure.errorMessage)),
      (user) => emit(SignupSuccese(userEntity: user)),
    );
  }
}