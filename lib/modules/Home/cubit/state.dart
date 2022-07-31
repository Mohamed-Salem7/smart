abstract class HomeState{}


class InitialHomeState extends HomeState{}


class ChangeScreenBottom extends HomeState{}

class ChangeScreenDetailsState extends HomeState{}


class LoadingGetUserData extends HomeState{}

class SuccessGetUserData extends HomeState{}

class ErrorGetUserData extends HomeState {
  final String error;
  ErrorGetUserData(this.error);
}

class LoadingGetServiceState extends HomeState {}

class SuccessGetServiceState extends HomeState {}

class ErrorGetServiceState extends HomeState {
  final String error;
  ErrorGetServiceState(this.error);
}



class LoadingGetServicesState extends HomeState {}

class SuccessGetServicesState extends HomeState {}

class ErrorGetServicesState extends HomeState {
  final String error;
  ErrorGetServicesState(this.error);
}

class LoadingLogoutState extends HomeState {}


class SuccessLogoutState extends HomeState
{

}

class ErrorLogoutState extends HomeState {
  final String error;
  ErrorLogoutState(this.error);
}


class ChangeSelectItem extends HomeState {}

class IncrementSelectItem extends HomeState {}

class DecrementSelectItem extends HomeState {}
