part of 'screens.dart';

class StokScreen extends StatelessWidget {
  // void whatsAppOpen() async {
  //   await FlutterLaunch.launchWathsApp(phone: '087881836640', message: 'Test');
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.defaultWidth,
          height: SizeConfig.defaultHeight,
          color: whiteColor,
        ),
        Container(
          width: SizeConfig.defaultWidth,
          height: 104,
          color: mainColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: borderRadius10,
                color: whiteColor,
              ),
              child: PieChart(
                dataMap: {
                  'A +': 8.0,
                  'B +': 5.0,
                  'O +': 10.0,
                  'AB +': 2.0,
                  // 'A -': 8.0,
                  // 'B -': 5.0,
                  // 'O -': 10.0,
                  // 'AB -': 2.0,
                },
                colorList: [
                  Color(0xFFFE0024),
                  Color(0xFFDF344C),
                  Color(0xFFA74D5A),
                  Color(0xFF793A43),
                ],
                chartType: ChartType.ring,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 220),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 200),
              SvgPicture.asset('assets/oopss.svg', height: 200),
              Center(
                child: Text('Belum ada Stok darah untuk saat ini.',
                    style: blackTextFont),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 20.0,
            top: SizeConfig.defaultHeight / 1.23,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: () {
                //whatsAppOpen();
              },
              backgroundColor: mainColor,
              child: Icon(MdiIcons.whatsapp),
            ),
          ),
        )
      ],
    );
  }
}
