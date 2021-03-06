part of '../widgets.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        minimum: minimumMarginRightLeft4,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.sizeHeight2 * 8,
                ), //79
                child: Image.asset('assets/onBoardingScreen2.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.sizeHeight2 * 5.4),
                child: Text(
                  'Dbloods adalah aplikasi kesehatan\n yang membantu anda untuk\n mencari stok golongan darah di beberapa rumah sakit di Jakarta dan mengetahui info tentang donor darah.',
                  textAlign: TextAlign.center,
                  style: greyTextFont.copyWith(fontSize: 20.0),
                ),
              ),
              Button(
                margin: EdgeInsets.only(
                    top: SizeConfig.sizeHeight2 * 12,
                    bottom: SizeConfig.sizeHeight2 * 2), //120,20
                width: SizeConfig.defaultWidth / 1.4,
                height: SizeConfig.defaultWidth / 8, //65
                color: mainColor,
                text: Text(
                  'AYO, GUNAKAN DBLOODS SEKARANG !',
                  style: whiteTextFont3.copyWith(
                      fontSize: SizeTheme.sizeHorizontal * 3,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToRegistrationScreen(RegistrationData()));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sudah Punya Akun ?',
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.bloc<ScreenBloc>().add(GoToSignInScreen());
                      },
                      child: Text(' Sign In disini.', style: redTextFont))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
