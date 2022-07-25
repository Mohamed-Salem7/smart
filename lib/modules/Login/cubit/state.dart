abstract class LoginState{}

class InitialLoginState extends LoginState {}


class LoadingResendState extends LoginState {}

class SuccessResendState extends LoginState {}


class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState
{
  final String uid;
  SuccessLoginState(this.uid);
}

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

class SaveTextFormField extends LoginState {}



class SuccessRegisterDealer extends LoginState {}

class ErrorRegisterDealer extends LoginState {
  final String error;
  ErrorRegisterDealer(this.error);
}


class LoadingRegisterDealer extends LoginState {}

class LoadingLogoutState extends LoginState {}

class SuccessLogoutState extends LoginState {}

class ErrorLogoutState extends LoginState {
  final String error;
  ErrorLogoutState(this.error);
}
