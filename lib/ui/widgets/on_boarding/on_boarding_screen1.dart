part of '../widgets.dart';

class OnBoardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: SizeConfig.sizeHeight2 * 10,
              left: SizeConfig.defaultWidth / 3.2,
              child: Container(
                height: SizeConfig.sizeHeight * 2.5, //250
                width: SizeConfig.sizeWidth * 4.1, //200
                child: SvgPicture.asset('assets/logo.svg'),
              ),
            ),
            Positioned(
              top: SizeConfig.defaultHeight / 2.35, //400
              left: SizeConfig.defaultWidth / 2.5,
              child: Text(
                'Dbloods',
                style: blackTextFont.copyWith(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: SizeConfig.defaultHeight / 2.04, //460
              left: SizeConfig.defaultWidth / 12,
              child: Text(
                'Donor Darah jadi lebih mudah dengan\n Dbloods.',
                style: blackTextFont.copyWith(fontSize: 20, color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
