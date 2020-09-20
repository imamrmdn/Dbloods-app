part of '../widgets.dart';

class OnBoardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        minimum: minimumMarginRightLeft4,
        child: Column(
          children: <Widget>[
            //
            Container(
              margin: EdgeInsets.only(
                top: SizeTheme.sizekVertical * 14,
                bottom: SizeTheme.sizekVertical * 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: SizeTheme.sizekVertical * 25,
                  ),
                ],
              ),
            ),
            //
            Text(
              'Donor Darah jadi lebih mudah dengan\n Dbloods.',
              style: greyTextFont.copyWith(
                fontSize: SizeTheme.sizeHorizontal * 4.5,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
