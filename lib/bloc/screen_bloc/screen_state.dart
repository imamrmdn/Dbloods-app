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
  final int bottomNavBarIndex;

  OnMainScreen({this.bottomNavBarIndex});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnRegistrationScreen extends ScreenState {
  final RegistrationData registrationData;

  OnRegistrationScreen(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnAccountConfirmationScreen extends ScreenState {
  final RegistrationData registrationData;

  OnAccountConfirmationScreen(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnEventDetailScreen extends ScreenState {
  final EventDonor eventDonor;

  OnEventDetailScreen(this.eventDonor);

  @override
  List<Object> get props => [eventDonor];
}

class OnInformasiDetailScreen extends ScreenState {
  final Informasi informasi;

  OnInformasiDetailScreen(this.informasi);

  @override
  List<Object> get props => [informasi];
}

class OnEdukasiDetailScreen extends ScreenState {
  final Edukasi edukasiDonor;

  OnEdukasiDetailScreen(this.edukasiDonor);

  @override
  List<Object> get props => [edukasiDonor];
}

class OnEditProfileScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnRiwayatDonorScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnAboutAppScreen extends ScreenState {
  @override
  List<Object> get props => [];
}
