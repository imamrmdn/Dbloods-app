part of 'screens.dart';

class AccountConfirmationScreen extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationScreen(this.registrationData);

  @override
  _AccountConfirmationScreenState createState() =>
      _AccountConfirmationScreenState();
}

class _AccountConfirmationScreenState extends State<AccountConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToRegistrationScreen(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: SafeArea(
          minimum: minimumMarginRightLeft,
          child: ListView(
            children: <Widget>[
              Text('Konfirmasi Akunmun'),
            ],
          ),
        ),
      ),
    );
  }
}
