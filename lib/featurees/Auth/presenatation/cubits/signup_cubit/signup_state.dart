part of 'signup_cubit.dart';



@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccese extends SignupState {
  final UserEntity userEntity;
  SignupSuccese({required this.userEntity});
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}
