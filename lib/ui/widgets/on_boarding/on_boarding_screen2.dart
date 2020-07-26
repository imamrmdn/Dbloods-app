part of '../widgets.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        minimum: minimumMarginRightLeft,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 79),
                child: Image.asset('assets/onBoardingScreen2.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  'Dbloods adalah aplikasi kesehatan\n yang membantu anda untuk\n mencari stok golongan darah di beberapa rumah sakit di Jakarta dan mengetahui info tentang donor darah.',
                  textAlign: TextAlign.center,
                  style: greyTextFont.copyWith(fontSize: 20.0),
                ),
              ),
              Button(
                margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 1.4
                        : SizeConfig.defaultWidth / 2.4,
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 8
                        : 80, //65
                text: Text(
                  'AYO, GUNAKAN DBLOODS SEKARANG',
                  style: whiteTextFont3.copyWith(
                      fontSize: 14.0, fontWeight: FontWeight.normal),
                ),
                color: mainColor,
                splashColor: accentColor4,
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
