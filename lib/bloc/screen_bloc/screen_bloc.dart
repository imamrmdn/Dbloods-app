import 'dart:async';
import 'package:dbloods_app/bloc/blocs.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc(ScreenState initialState) : super(initialState);

  @override
  Stream<ScreenState> mapEventToState(ScreenEvent event) async* {
    if (event is GoToOnBoardingScreen) {
      yield OnOnBoardingScreen();
    } else if (event is GoToSignInScreen) {
      yield OnSignInScreen();
    } else if (event is GoToMainScreen) {
      yield OnMainScreen(
          bottomNavBarIndex: event.bottomNavBarIndex,
          initialIndex: event.initialIndex);
    } else if (event is GoToRegistrationScreen) {
      yield OnRegistrationScreen(event.registrationData);
    } else if (event is GoToAccountConfirmationScreen) {
      yield OnAccountConfirmationScreen(event.registrationData);
    } else if (event is GoToEventDetailScreen) {
      yield OnEventDetailScreen(event.eventDonor);
    } else if (event is GoToGetDonorIdScreen) {
      yield OnGetDonorIdScreen(event.eventId);
    } else if (event is GoToSuccesScreen) {
      yield OnSuccesScreen(event.eventId, event.transaction);
    } else if (event is GoToInformasiDetailScreen) {
      yield OnInformasiDetailScreen(event.informasi);
    } else if (event is GoToEdukasiDetailScreen) {
      yield OnEdukasiDetailScreen(event.edukasiDonor);
    } else if (event is GoToEditProfileScreen) {
      yield OnEditProfileScreen(event.user);
    } else if (event is GoToRiwayatDonorScreen) {
      yield OnRiwayatDonorScreen();
    } else if (event is GoToAboutAppScreen) {
      yield OnAboutAppScreen();
    }
  }
}
