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

