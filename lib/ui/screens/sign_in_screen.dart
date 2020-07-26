part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignIn = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool _showPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          minimum: EdgeInsets.only(left: 30.0, right: 30.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: SvgPicture.asset(
                  'assets/logo2.svg',
                  //fit: BoxFit.fill,
                  height: 150.0,
                  width: 90.0,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Dbloods',
                    style: whiteTextFont.copyWith(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 80),
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
                    suffixIcon: Icon(Icons.email, color: blackColor),
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Password :',
                    style: blackTextFont.copyWith(fontSize: 18.0),
                  ),
                  TextInputField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    textInputType: TextInputType.text,
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Lupa Password?', style: blackTextFont),
                  Text('Klik Disini.', style: whiteTextFont)
                ],
              ),
              Button(
                margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
                width: SizeConfig.defaultWidth / 1.4,
                height: SizeConfig.defaultWidth / 8, //65
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: whiteTextFont.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    isSignIn ? Loading(color: whiteColor) : Text('')
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
                          Flushbar(
                            duration: Duration(seconds: 3),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Colors.yellowAccent,
                            messageText: Text(result.message,
                                style: blackTextFont.copyWith(
                                    fontWeight: FontWeight.bold)),
                            leftBarIndicatorColor: blackColor,
                          )..show(context);
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
                  Text(
                    'Sign Up.',
                    style: whiteTextFont.copyWith(fontSize: 14),
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
