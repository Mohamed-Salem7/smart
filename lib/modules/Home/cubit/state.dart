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

class LoadingGetElectricityState extends HomeState {}

class SuccessGetElectricityState extends HomeState {}

class ErrorGetElectricityState extends HomeState {
  final String error;
  ErrorGetElectricityState(this.error);
}

