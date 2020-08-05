part of 'screens.dart';

class AccountConfirmationScreen extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationScreen(this.registrationData);

  @override
  _AccountConfirmationScreenState createState() =>
      _AccountConfirmationScreenState();
}

class _AccountConfirmationScreenState extends State<AccountConfirmationScreen> {
  bool isConfirm = false;

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
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              context
                  .bloc<ScreenBloc>()
                  .add(GoToRegistrationScreen(widget.registrationData));
            },
          ),
          title: Text('Konfirmasi Akunmu'),
        ),
        body: SafeArea(
          minimum: minimumMarginRightLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //profilepicture
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: mainColor),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              (widget.registrationData.profilePicture == null)
                                  ? AssetImage('assets/user_profile.png')
                                  : FileImage(
                                      widget.registrationData.profilePicture),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${widget.registrationData.nama}',
                          style: blackTextFont.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.registrationData.email}',
                          style: blackTextFont.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              isConfirm
                  ? Loading(height: 50, width: 50, color: mainColor)
                  : RaisedButton(
                      child: Text('Confirm'),
                      onPressed: () async {
                        setState(() {
                          isConfirm = true;
                        });

                        SignInSignUpResult result = await AuthServices.signUp(
                          widget.registrationData.nama,
                          widget.registrationData.email,
                          widget.registrationData.golDarah,
                          widget.registrationData.tempatLahir,
                          widget.registrationData.tanggalLahir,
                          widget.registrationData.jenkel,
                          widget.registrationData.pekerjaan,
                          widget.registrationData.password,
                        );

                        if (result.user == null) {
                          setState(() {
                            isConfirm = false;
                          });
                          Flushbar(
                            duration: Duration(seconds: 2),
                            flushbarPosition: FlushbarPosition.TOP,
                            icon: Icon(Icons.info_outline, color: whiteColor),
                            backgroundColor: Colors.red,
                            messageText:
                                Text(result.message, style: whiteTextFont),
                          )..show(context);
                        }

                        //context.bloc<ScrenBloc>()
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
