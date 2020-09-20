part of 'screens.dart';

class OnBoardingScreen extends StatelessWidget {
  final pageController = PageController();
  final List<Widget> onBoardingScreenList = [
    OnBoardingScreenOne(),
    OnBoardingScreenTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: pageController,
              itemCount: onBoardingScreenList.length,
              itemBuilder: (context, index) => onBoardingScreenList[index],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.defaultHeight / 1.5,
                left: SizeConfig.defaultWidth / 2.1,
              ),
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: WormEffect(
                  activeDotColor: mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
