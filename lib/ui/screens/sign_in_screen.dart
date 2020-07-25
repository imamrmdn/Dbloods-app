part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<ScreenBloc>().add(GoToOnBoardingScreen());
        return;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          minimum: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 70.0, right: 70.0, top: 70.0),
                  width: 210,
                  height: 85,
                  child: SvgPicture.asset(
                    'assets/logo_dbloods.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 150),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alamat Email :',
                      style: greyTextFont.copyWith(fontSize: 18.0),
                    ),
                    TextInputField(
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      suffixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Password :',
                      style: greyTextFont.copyWith(fontSize: 18.0),
                    ),
                    TextInputField(
                      obscureText: true,
                      textInputType: TextInputType.text,
                      suffixIcon: Icon(Icons.visibility),
                    ),
                  ],
                ),
                Button(
                  margin: EdgeInsets.only(top: 100.0, bottom: 20.0),
                  width: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? SizeConfig.defaultWidth / 1.4
                      : SizeConfig.defaultWidth / 2.8,
                  height: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
