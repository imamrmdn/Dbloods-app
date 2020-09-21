part of 'screen_bloc.dart';

abstract class ScreenEvent extends Equatable {
  const ScreenEvent();
}

class GoToOnBoardingScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToMainScreen extends ScreenEvent {
  final int bottomNavBarIndex;
  final int initialIndex;

  GoToMainScreen({this.bottomNavBarIndex = 0, this.initialIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex, initialIndex];
}

class GoToRegistrationScreen extends ScreenEvent {
  final RegistrationData registrationData;

  GoToRegistrationScreen(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationScreen extends ScreenEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationScreen(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToEventDetailScreen extends ScreenEvent {
  final EventDonor eventDonor;

  GoToEventDetailScreen(this.eventDonor);

  @override
  List<Object> get props => [eventDonor];
}

class GoToInformasiDetailScreen extends ScreenEvent {
  final Informasi informasi;

  GoToInformasiDetailScreen(this.informasi);

  @override
  List<Object> get props => [informasi];
}

class GoToEdukasiDetailScreen extends ScreenEvent {
  final Edukasi edukasiDonor;

  GoToEdukasiDetailScreen(this.edukasiDonor);

  @override
  List<Object> get props => [edukasiDonor];
}

class GoToEditProfileScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToRiwayatDonorScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToAboutAppScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}
