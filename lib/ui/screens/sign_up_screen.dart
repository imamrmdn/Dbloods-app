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
  final List<String> pekerjaan = [
    'TNI',
    'POLRI',
    'Peg. Negeri',
    'Peg. Swasta',
    'Mahasiswa',
    'Dosen',
    'Dokter',
    'Wiraswasta',
    'Buruh',
    'Pedagang',
    'Lain-lain',
  ];
  String _currentGolDarah;
  String jenkelVal;
  String pekerjaanVal;
  int jenkelType = 0;
  int _defaultChoiceIndex = 4;
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  //bool _isSelected = false;

  void _handleJenkelType(int value) {
    setState(() {
      jenkelType = value;
      switch (jenkelType) {
        case 1:
          jenkelVal = 'Laki-Laki';
          break;
        case 2:
          jenkelVal = 'Perempuan';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    emailController.text = widget.registrationData.email;
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
              sizedBoxDefault,
              Text('Jenis Kelamin', style: blackTextFont),
              //Radio button
              Row(
                children: <Widget>[
                  //
                  Radio(
                    value: 1,
                    groupValue: jenkelType,
                    onChanged: _handleJenkelType,
                    activeColor: mainColor,
                  ),
                  Text('Laki - Laki'),
                  SizedBox(width: 30.0),
                  //
                  Radio(
                    value: 2,
                    groupValue: jenkelType,
                    onChanged: _handleJenkelType,
                    activeColor: mainColor,
                  ),
                  Text('Perempuan'),
                ],
              ),
              sizedBoxDefault,
              Text('Pekerjaan', style: blackTextFont),
              sizedBoxDefault,
              //
              Wrap(
                children: List<Widget>.generate(
                    pekerjaan.length,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            selected: _defaultChoiceIndex == index,
                            selectedColor: mainColor,
                            label: Text(
                              pekerjaan[index],
                              style: blackTextFont,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: borderRadius5,
                              side: BorderSide(width: 1, color: greyColor),
                            ),
                            backgroundColor: whiteColor,
                            onSelected: (selected) {
                              setState(() {
                                _defaultChoiceIndex = selected ? index : null;
                              });
                            },
                          ),
                        )).toList(),
              ),

              TextInputField(
                obscureText: !_showPassword,
                controller: passwordController,
                cursorColor: mainColor,
                textInputType: TextInputType.text,
                hintText: 'Password',
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
              sizedBoxDefault,
              TextInputField(
                obscureText: !_showConfirmPassword,
                controller: passwordController,
                cursorColor: mainColor,
                textInputType: TextInputType.text,
                hintText: 'Confirm Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                  child: Icon(_showConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              sizedBoxDefault,
              RaisedButton(
                child: Text('print debug'),
                onPressed: () {
                  if (!(namaController.text.trim() != '' &&
                      emailController.text.trim() != '' &&
                      tempatLahirController.text.trim() != '' &&
                      tanggalLahirController.text.trim() != '' &&
                      passwordController.text.trim() != '' &&
                      confirmPasswordController.text.trim() != '')) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text('Silahkan isi semua field.',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (!EmailValidator.validate(emailController.text)) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text('Format email salah anda salah!',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (_currentGolDarah == null) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text('Golongan Darah belum diisi',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (!(tempatLahirController.text.length <= 15)) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text(
                          'Tempat Lahir tidak boleh lebih dari 15 kata.',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (!(jenkelVal != null &&
                      _defaultChoiceIndex != null)) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text(
                          'Jenis kelamin dan pekerjaan harus diisi',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text(
                          'Password tidak sama dengan Confirm password',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else if (passwordController.text.length < 6) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text(
                          'Password minimal 6 karakter atau lebih',
                          style: blackTextFont),
                      backgroundColor: Colors.yellow,
                      icon: Icon(Icons.info_outline),
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  } else {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Column(
                        children: <Widget>[
                          Text('${namaController.text}', style: blackTextFont),
                          Text('$_currentGolDarah', style: blackTextFont),
                          Text('${emailController.text}', style: blackTextFont),
                          Text('${tempatLahirController.text}',
                              style: blackTextFont),
                          Text('${tanggalLahirController.text}',
                              style: blackTextFont),
                          Text('$jenkelVal', style: blackTextFont),
                          Text('$_defaultChoiceIndex', style: blackTextFont),
                        ],
                      ),
                      backgroundColor: Colors.green,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: Colors.teal,
                    )..show(context);
                  }
                },
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}
