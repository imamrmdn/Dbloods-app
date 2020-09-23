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
  final int initialIndex;

  OnMainScreen({this.bottomNavBarIndex = 0, this.initialIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex, initialIndex];
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

class OnGetDonorIdScreen extends ScreenState {
  final EventId eventId;

  OnGetDonorIdScreen(this.eventId);

  @override
  List<Object> get props => [eventId];
}

//suksespage
class OnSuccesScreen extends ScreenState {
  final EventId eventId;

  OnSuccesScreen(this.eventId);

  @override
  List<Object> get props => [eventId];
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
  final User user;

  OnEditProfileScreen(this.user);

  @override
  List<Object> get props => [user];
}

class OnRiwayatDonorScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnAboutAppScreen extends ScreenState {
  @override
  List<Object> get props => [];
}
