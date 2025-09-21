import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/forgot_pass_cubit/forgot_pass_state.dart';
import 'package:bloc/bloc.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final AuthRepos authRepos;

  ForgotPassCubit(this.authRepos) : super(ForgotPasswordInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgotPasswordLoading());

    final result = await authRepos.sendSignInLink(email);

    result.fold(
      (failure) => emit(ForgotPasswordFailure(message: failure.toString())),
      (_) =>
          emit(ForgotPasswordSuccess(message: "📩 الرابط تم إرساله للبريد!")),
    );
  }
}
