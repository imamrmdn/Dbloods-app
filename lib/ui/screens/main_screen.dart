part of 'screens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              //
              Container(
                width: SizeConfig.defaultWidth,
                height: SizeConfig.defaultHeight,
                color: Color(0xFFEDEDED),
              ),
              //
              //
              PageView(
                controller: pageController,
                children: <Widget>[
                  HomeScreen(),
                  InfoScreen(),
                  StokScreen(),
                  ProfileScreen(),
                ],
                onPageChanged: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                  });
                },
              ),
              BottomNavBarCustom(
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6.0),
                      height: 20,
                      child: SvgPicture.asset((bottomNavBarIndex == 0)
                          ? 'assets/home.svg'
                          : 'assets/home_grey.svg'),
                    ),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6.0),
                      height: 20,
                      child: SvgPicture.asset((bottomNavBarIndex == 1)
                          ? 'assets/info.svg'
                          : 'assets/info_grey.svg'),
                    ),
                    title: Text('Info'),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6.0),
                      height: 20,
                      child: SvgPicture.asset((bottomNavBarIndex == 2)
                          ? 'assets/stok.svg'
                          : 'assets/stok_grey.svg'),
                    ),
                    title: Text('Stok'),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6.0),
                      height: 20,
                      child: SvgPicture.asset((bottomNavBarIndex == 3)
                          ? 'assets/profile.svg'
                          : 'assets/profile_grey.svg'),
                    ),
                    title: Text('Profile'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
