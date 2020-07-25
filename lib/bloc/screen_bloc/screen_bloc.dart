import 'dart:async';
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
      yield OnMainScreen();
    }
  }
}
