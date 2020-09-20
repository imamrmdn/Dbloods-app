part of 'screens.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevScreenEvent is GoToOnBoardingScreen)) {
        prevScreenEvent = GoToOnBoardingScreen();
        context.bloc<ScreenBloc>().add(prevScreenEvent);
      }
    } else {
      if (!(prevScreenEvent is GoToMainScreen)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevScreenEvent = GoToMainScreen();
        context.bloc<ScreenBloc>().add(prevScreenEvent);
      }
    }

    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (_, screenState) => (screenState is OnOnBoardingScreen)
          ? OnBoardingScreen()
          : (screenState is OnSignInScreen)
              ? SignInScreen()
              : (screenState is OnRegistrationScreen)
                  ? SignUpScreen(screenState.registrationData)
                  : (screenState is OnAccountConfirmationScreen)
                      ? AccountConfirmationScreen(screenState.registrationData)
                      : (screenState is OnEventDetailScreen)
                          ? EventDetailScreen(screenState.eventDonor)
                          : (screenState is OnInformasiDetailScreen)
                              ? InformasiDetailScreen(screenState.informasi)
                              : (screenState is OnEdukasiDetailScreen)
                                  ? EdukasiDetailScreen(
                                      screenState.edukasiDonor)
                                  : (screenState is OnEditProfileScreen)
                                      ? EditProfileScreen()
                                      : (screenState is OnRiwayatDonorScreen)
                                          ? RiwayatDonorScreen()
                                          : (screenState is OnAboutAppScreen)
                                              ? AboutAppScreen()
                                              : MainScreen(
                                                  bottomNavBarIndex:
                                                      (screenState
                                                              as OnMainScreen)
                                                          .bottomNavBarIndex,
                                                ),

      // TODO: delete param bottomNavBarIndex if you sign in, add again if you after sign in
    );
  }
}
