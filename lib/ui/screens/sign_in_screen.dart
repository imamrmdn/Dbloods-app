part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignIn = false;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
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
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.email, color: blackColor),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Password :',
                    style: blackTextFont.copyWith(fontSize: 18.0),
                  ),
                  TextInputField(
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
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 1.4
                        : SizeConfig.defaultWidth / 2.8,
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 8
                        : 80, //65
                text: Text(
                  'Sign In',
                  style: whiteTextFont.copyWith(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  AuthServices.signIn('admin@dbloods.com', '123456');
                },
                color: blackColor,
                splashColor: mainColor,
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
