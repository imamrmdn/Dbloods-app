part of 'screens.dart';

class StokScreen extends StatefulWidget {
  @override
  _StokScreenState createState() => _StokScreenState();
}

class _StokScreenState extends State<StokScreen> {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 70.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: mainColor,
          child: Icon(
            MdiIcons.whatsapp,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  color: mainColor,
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 140, 20, 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        cursorColor: mainColor,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'cari stok darah di rumah sakit',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          '* tanya admin untuk ketersedian stok darah melalui whatsapp'),

                      SizedBox(height: 20),
                      //list of stok darah
                      Expanded(
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return Card(
                                elevation: 2,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: SizeConfig.defaultWidth,
                                  height: 65,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //heading chart
          Card(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius8,
            ),
            child: Container(
              height: SizeConfig.defaultHeight / 5,
              width: SizeConfig.defaultWidth,
              padding: EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PieChart(
                    dataMap: {
                      'A +': 8.0,
                      'B +': 5.0,
                      'O +': 10.0,
                      'AB +': 2.0,
                    },
                    colorList: [
                      Color(0xFFFE0024),
                      Color(0xFFDF344C),
                      Color(0xFFA74D5A),
                      Color(0xFF793A43),
                    ],
                    legendPosition: LegendPosition.left,
                  ),
                  PieChart(
                    dataMap: {
                      'A -': 8.0,
                      'B -': 5.0,
                      'O -': 10.0,
                      'AB -': 2.0,
                    },
                    colorList: [
                      Color(0xFFFE0024),
                      Color(0xFFDF344C),
                      Color(0xFFA74D5A),
                      Color(0xFF793A43),
                    ],
                    legendPosition: LegendPosition.left,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
