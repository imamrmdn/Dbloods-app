part of 'screen_bloc.dart';

abstract class ScreenState extends Equatable {
  const ScreenState();
}

class OnInitialScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnSignInScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnOnBoardingScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnMainScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnRegistrationScreen extends ScreenState {
  final RegistrationData registrationData;

  OnRegistrationScreen(this.registrationData);
  @override
  List<Object> get props => [];
}
