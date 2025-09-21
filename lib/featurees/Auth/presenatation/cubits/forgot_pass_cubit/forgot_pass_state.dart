
class ForgotPassState{}

class ForgotPasswordInitial extends ForgotPassState {}

class ForgotPasswordLoading extends ForgotPassState {}

class ForgotPasswordSuccess extends ForgotPassState {
  final String message;
  ForgotPasswordSuccess({required this.message});

 
}

class ForgotPasswordFailure extends ForgotPassState {
  final String message;
  ForgotPasswordFailure({required this.message});

 
}