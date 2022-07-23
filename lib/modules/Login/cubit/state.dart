abstract class LoginState{}

class InitialLoginState extends LoginState {}


class LoadingResendState extends LoginState {}

class SuccessResendState extends LoginState {}


class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState
{
  final String error;
  ErrorLoginState(this.error);
}

