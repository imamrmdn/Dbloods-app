part of 'screens.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text = [];

    for (int i = 0; i <= 50; i++) {
      text.add(i);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          bottom: TabBar(
            indicatorColor: whiteColor,
            tabs: <Widget>[
              Tab(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MdiIcons.viewList),
                  SizedBox(width: 10),
                  Text('Informasi', style: TextStyle(fontSize: 18)),
                ],
              )),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(MdiIcons.castEducation),
                    SizedBox(width: 10),
                    Text('Edukasi', style: TextStyle(fontSize: 18)),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              width: SizeConfig.defaultWidth,
              height: SizeConfig.defaultHeight,
              color: whiteColor,
              child: SafeArea(
                minimum: minimumMarginRightLeft,
                child: Center(
                  child: Text('Informasi'),
                ),
              ),
            ),
            Container(
              width: SizeConfig.defaultWidth,
              height: SizeConfig.defaultHeight,
              color: whiteColor,
              child: Center(
                child: Text('tab Edukasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
