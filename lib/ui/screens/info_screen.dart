part of 'screens.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(bottom: 80.0),
              child: ListView.builder(
                  itemCount: informasi.length,
                  itemBuilder: (context, index) {
                    return CardCustomInformasi(
                      informasi: informasi[index],
                    );
                  }),
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
