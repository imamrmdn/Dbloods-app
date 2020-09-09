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
        body: Container(
          color: mainColor,
          child: SafeArea(
            child: Container(
              width: SizeConfig.defaultWidth,
              color: whiteColor,
              child: SafeArea(
                minimum: minimumMarginRightLeft4,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeTheme.sizekVertical * 15,
                          bottom: SizeTheme.sizekVertical * 2),
                      child: Image.asset(
                        'assets/confirm_akun.png',
                        height: SizeTheme.sizekVertical * 30,
                        width: SizeTheme.sizeHorizontal * 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('Berhasil Membuat Akun Dbloodsmu Konfirm Sekarang!',
                        style: blackTextFont.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 30.0),
                    isConfirm
                        ? Loading(height: 50, width: 50, color: mainColor)
                        : Container(
                            width: SizeConfig.defaultWidth / 1.3,
                            height: SizeTheme.sizekVertical * 6,
                            child: RaisedButton(
                              color: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: borderRadius10,
                              ),
                              child: Text('Confirm',
                                  style: whiteTextFont.copyWith(
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                setState(() {
                                  isConfirm = true;
                                });

                                imageFileToUpload =
                                    widget.registrationData.profilePicture;

                                SignInSignUpResult result =
                                    await AuthServices.signUp(
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
                                  showBottomSheetValidator(
                                    context,
                                    text1: result.message,
                                    text2: 'Kembali ke Sign Up',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      context.bloc<ScreenBloc>().add(
                                            GoToRegistrationScreen(
                                                widget.registrationData),
                                          );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
