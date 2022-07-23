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
class ChangeVisibilityPassword extends LoginState{}

class LoadingLoginUserState extends LoginState {}

class SuccessLoginUserState extends LoginState {}


class ErrorLoginUserState extends LoginState {
  final String error;
  ErrorLoginUserState(this.error);
}

class LoadingRegisterClient extends LoginState {}


class SuccessRegisterClient extends LoginState {}

class ErrorRegisterClient extends LoginState {
  final String error;
  ErrorRegisterClient(this.error);
}