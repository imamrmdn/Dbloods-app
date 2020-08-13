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
  Widget sizedBoxDefault2 = SizedBox(height: SizeConfig.sizeHeight2 * 1);
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
    namaController.text = widget.registrationData.nama.trim();
    tempatLahirController.text = widget.registrationData.tempatLahir.trim();
    tanggalLahirController.text = widget.registrationData.tanggalLahir;
    //_currentGolDarah = widget.registrationData.golDarah;
    // if (_currentGolDarah != null) {
    //   _currentGolDarah = widget.registrationData.golDarah;
    // } else {
    //   return null;
    // }
    // jenkelVal = widget.registrationData.jenkel;
    // passwordController.text = widget.registrationData.password.trim();
    // confirmPasswordController.text = widget.registrationData.password.trim();
  }

  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
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
          title: Text('Silahkan isi data untuk Sign Up',
              style: whiteTextFont.copyWith(
                  fontSize: SizeTheme.sizeHorizontal * 4)),
          backgroundColor: mainColor,
        ),
        body: SafeArea(
          minimum: minimumMarginRightLeft4,
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
                    showFlushBar(context,
                        icon: Icon(Icons.done_outline),
                        text: 'Berhasil menambah Poto Profile',
                        color: Colors.greenAccent);
                    if (widget.registrationData.profilePicture == null) {
                      showFlushBar(context,
                          text: 'Anda belum menambah Poto Profile');
                    }
                  } else {
                    widget.registrationData.profilePicture = null;
                    showFlushBar(context,
                        icon: Icon(Icons.cancel),
                        text: 'Berhasil menghapus Poto Profile',
                        color: Colors.red[300]);
                  }
                  setState(() {});
                },
              ),
              sizedBoxDefault2,
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultWidth / 1.7,
                    child: TextInputField(
                      controller: namaController,
                      obscureText: false,
                      cursorColor: mainColor,
                      hintText: 'Nama',
                      textInputType: TextInputType.text,
                    ),
                  ),
                  Container(
                    width: SizeConfig.defaultWidth / 4.4,
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
                hintText: 'Email Aktif Anda',
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
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
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
                  SizedBox(width: SizeConfig.sizeWidth2 * 3),
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
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.sizeWidth2 * 1),
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
                          _defaultChoiceIndex = index;
                        });
                      },
                    ),
                  ),
                ).toList(),
              ),
              //
              TextInputField(
                obscureText: !_showPassword,
                controller: passwordController,
                cursorColor: mainColor,
                textInputType: TextInputType.text,
                hintText: 'Password',
                //validator: validatePassword,
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
                controller: confirmPasswordController,
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
              ButtonNext(
                onPressed: () {
                  if (!(namaController.text.trim() != '' &&
                      emailController.text.trim() != '' &&
                      tempatLahirController.text.trim() != '' &&
                      tanggalLahirController.text.trim() != '' &&
                      passwordController.text.trim() != '' &&
                      confirmPasswordController.text.trim() != '')) {
                    showFlushBar(context);
                  } else if (!EmailValidator.validate(emailController.text)) {
                    showFlushbarCustom(context,
                        title: 'Warning !',
                        text: 'Masukan Format email dengan benar');
                  } else if (_currentGolDarah == null) {
                    showFlushBar(context, text: 'Golongan Darah belum diisi');
                  } else if (!(tempatLahirController.text.length <= 15)) {
                    showFlushBar(context,
                        text: 'Tempat Lahir tidak boleh lebih dari 15 kata');
                  } else if (!(jenkelVal != null)) {
                    showFlushBar(context, text: 'Jenis Kelamin harus diisi');
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    showFlushBar(context,
                        text: 'Password tidak sama dengan Confirm Password');
                  } else if (passwordController.text.length < 6) {
                    showFlushBar(context,
                        text: 'Password minimal 6 karakter atau lebih');
                  } else if (int.parse(
                          formatAge(tanggalLahirController.text)) <=
                      17) {
                    showBottomSheetValidator(
                      context,
                      text1:
                          'Umur Anda Belum Mencukupi Untuk Mengikuti Donor Darah ',
                      text2: 'Kembali',
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.bloc<ScreenBloc>().add(GoToSignInScreen());
                      },
                    );
                  } else {
                    //
                    widget.registrationData.nama = namaController.text;
                    widget.registrationData.golDarah = _currentGolDarah;
                    widget.registrationData.email = emailController.text;
                    widget.registrationData.tempatLahir =
                        tempatLahirController.text;
                    widget.registrationData.tanggalLahir =
                        tanggalLahirController.text;
                    widget.registrationData.jenkel = jenkelVal;
                    widget.registrationData.pekerjaan =
                        pekerjaan[_defaultChoiceIndex];
                    widget.registrationData.password = passwordController.text;

                    //
                    context.bloc<ScreenBloc>().add(
                        GoToAccountConfirmationScreen(widget.registrationData));
                  }
                },
              ),
              //
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
