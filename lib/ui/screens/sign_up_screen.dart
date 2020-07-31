part of 'screens.dart';

class SignUpScreen extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpScreen(this.registrationData);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Widget sizedBoxDefault = SizedBox(height: SizeConfig.defaultWidth / 24);
  final List<String> golDarah = [
    'tidak tahu',
    'A +',
    'B +',
    'O +',
    'AB +',
    'A -',
    'B -',
    'O -',
    'AB -',
  ];
  String _currentGolDarah;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    //namaController.text = widget.registrationData.nama;
    emailController.text = widget.registrationData.email;
    //tempatLahirController.text = widget.registrationData.tempatLahir;
    tanggalLahirController.text = widget.registrationData.tanggalLahir;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToSignInScreen());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.bloc<ScreenBloc>().add(GoToSignInScreen());
            },
            child: Icon(Icons.arrow_back, color: whiteColor),
          ),
          title: Text('Silahkan isi data untuk Sign Up', style: whiteTextFont),
        ),
        body: SafeArea(
          minimum: minimumMarginRightLeft,
          child: ListView(
            children: <Widget>[
              //
              AddProfilePicture(
                image1: (widget.registrationData.profilePicture == null)
                    ? AssetImage('assets/user_profile.png')
                    : FileImage(widget.registrationData.profilePicture),
                image2: AssetImage(
                    (widget.registrationData.profilePicture == null)
                        ? 'assets/plus.png'
                        : 'assets/btn_min.png'),
                onTap: () async {
                  if (widget.registrationData.profilePicture == null) {
                    widget.registrationData.profilePicture = await getImage();
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text('Berhasil Menambah Profile Picture !',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.bold)),
                      backgroundColor: Color(0xFF19E72D),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: blackColor,
                    )..show(context);
                    if (widget.registrationData.profilePicture == null) {
                      Flushbar(
                        duration: Duration(seconds: 2),
                        messageText: Text('Gagal Menambah Profile Picture!',
                            style: blackTextFont),
                        backgroundColor: Colors.yellowAccent,
                        flushbarPosition: FlushbarPosition.TOP,
                        leftBarIndicatorColor: blackColor,
                      )..show(context);
                    }
                  } else {
                    widget.registrationData.profilePicture = null;
                    Flushbar(
                      duration: Duration(seconds: 1),
                      messageText: Text('Poto Profile Berhasil Dihapus.',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: blackColor,
                    )..show(context);
                  }
                  setState(() {});
                },
              ),
              SizedBox(height: 10.0),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextInputField(
                      controller: namaController,
                      obscureText: false,
                      cursorColor: mainColor,
                      hintText: 'Nama',
                      textInputType: TextInputType.text,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.4,
                    child: DropdownButtonFormField(
                      value: _currentGolDarah,
                      onChanged: (val) =>
                          setState(() => _currentGolDarah = val),
                      hint: Text('Gol Darah',
                          style: blackTextFont.copyWith(fontSize: 15.0)),
                      items: golDarah.map((item) {
                        return DropdownMenuItem(
                            value: item, child: Text('$item'));
                      }).toList(),
                    ),
                  )
                ],
              ),
              sizedBoxDefault,
              //
              TextInputField(
                controller: emailController,
                obscureText: false,
                cursorColor: mainColor,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              sizedBoxDefault,
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.defaultWidth / 2.5 + 10,
                    child: TextInputField(
                      controller: tempatLahirController,
                      obscureText: false,
                      cursorColor: mainColor,
                      hintText: 'Tempat Lahir',
                      textInputType: TextInputType.text,
                    ),
                  ),
                  Container(
                    width: SizeConfig.defaultWidth / 2.5,
                    child: DateFieldSignUp(
                      controller: tanggalLahirController,
                    ),
                  )
                ],
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
