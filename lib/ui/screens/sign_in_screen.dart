part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignIn = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: whiteColor)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<ScreenBloc>().add(GoToOnBoardingScreen());
        return;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          minimum: minimumMarginRightLeft3,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: SizeConfig.sizeHeight2 * 3), //30
                child: SvgPicture.asset(
                  'assets/logo2.svg',
                  //fit: BoxFit.fill,
                  height: SizeConfig.sizeHeight2 * 15, //150
                  width: SizeTheme.sizeHorizontal * 90, //90
                ),
              ),
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(top: SizeTheme.sizekVertical * 2), //20
                  child: Text(
                    'Dbloods',
                    style: whiteTextFont.copyWith(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: SizeTheme.sizekVertical * 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Alamat Email :',
                    style: blackTextFont.copyWith(fontSize: 18.0),
                  ),
                  TextInputField(
                    controller: emailController,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    cursorColor: whiteColor,
                    suffixIcon: Icon(Icons.email, color: blackColor),
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                  ),
                  SizedBox(height: SizeTheme.sizekVertical * 2.5),
                  Text(
                    'Password :',
                    style: blackTextFont.copyWith(fontSize: 18.0),
                  ),
                  TextInputField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    textInputType: TextInputType.text,
                    cursorColor: whiteColor,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: blackColor,
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: SizeTheme.sizekVertical * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Lupa Password?', style: blackTextFont),
                  Text('Klik Disini.', style: whiteTextFont)
                ],
              ),
              Button(
                margin: EdgeInsets.only(
                    top: SizeTheme.sizekVertical * 5,
                    bottom: SizeTheme.sizekVertical * 2), //50,20
                width: SizeConfig.defaultWidth / 1.4,
                height: SizeConfig.defaultWidth / 8, //65
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    isSignIn
                        ? Loading(color: whiteColor)
                        : Text(
                            'Sign In',
                            style: whiteTextFont.copyWith(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
                onTap: isEmailValid && isPasswordValid
                    ? () async {
                        setState(() {
                          isSignIn = true;
                        });
                        //
                        SignInSignUpResult result = await AuthServices.signIn(
                          emailController.text,
                          passwordController.text,
                        );
                        //
                        if (result.user == null) {
                          setState(() {
                            isSignIn = false;
                          });
                          //
                          showFlushbarCustom(context,
                              title: result.message,
                              text: 'silahkan masukan dengan benar');
                        }
                      }
                    : null,
                color: isEmailValid && isPasswordValid ? blackColor : greyColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Belum punya akun? ',
                    style: blackTextFont.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .bloc<ScreenBloc>()
                          .add(GoToRegistrationScreen(RegistrationData()));
                    },
                    child: Text(
                      'Sign Up.',
                      style: whiteTextFont.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
