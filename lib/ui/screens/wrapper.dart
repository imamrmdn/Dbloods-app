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
          : (screenState is OnSignInScreen) ? SignInScreen() : MainScreen(),
    );
  }
}
