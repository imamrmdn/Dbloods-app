part of 'screens.dart';

class StokScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      floatingActionButton: WhatsAppButton(),
      body: RefreshIndicator(
        color: mainColor,
        onRefresh: () async {
          context.bloc<StokdarahBloc>().add(FetchStokDarah());
          await Future.delayed(Duration(seconds: 2));
          return;
        },
        child: Stack(
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
                        Text(
                            '* tanya admin untuk permintaan stok darah melalui whatsapp.'),

                        SizedBox(height: 20),
                        //list of stok darah
                        Expanded(
                          child: BlocBuilder<StokdarahBloc, StokdarahState>(
                            builder: (_, stokState) {
                              if (stokState is StokDarahLoaded) {
                                List<StokDarah> stokDarah = stokState.stokDarah;
                                return ListView.builder(
                                  itemCount: stokDarah.length,
                                  itemBuilder: (context, i) {
                                    return StokDarahCard(
                                      image: (i.isEven)
                                          ? Image.asset('assets/hospital1.png')
                                          : Image.asset('assets/hospital2.png'),
                                      stokDarah: stokDarah[i],
                                    );
                                  },
                                );
                              } else {
                                return LoadingShimmer(
                                  height: 170,
                                );
                              }
                            },
                          ),
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
                child: BlocBuilder<StokdarahBloc, StokdarahState>(
                  builder: (_, stokState) {
                    if (stokState is StokDarahLoaded) {
                      List<StokDarah> stokdarah = stokState.stokDarah;
                      //
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              return showDialog(
                                context: context,
                                builder: (context) => JumlahGolonganDarah(
                                  title:
                                      'Jumlah Golongan Darah Positif dari ${stokdarah.length} Rumah Sakit di Jakarta',
                                  jumlahGolonganDarahA:
                                      ' Jumlah Golongan Darah A+ : ${hitungGolDarah(GolDarah.golApos, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahB:
                                      ' Jumlah Golongan Darah B+ : ${hitungGolDarah(GolDarah.golBpos, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahO:
                                      ' Jumlah Golongan Darah O+ : ${hitungGolDarah(GolDarah.golOpos, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahAB:
                                      ' Jumlah Golongan Darah AB+ : ${hitungGolDarah(GolDarah.golABpos, stokdarah).toInt()} Stok',
                                ),
                              );
                            },
                            child: PieChart(
                              dataMap: {
                                'A +':
                                    hitungGolDarah(GolDarah.golApos, stokdarah),
                                'B +':
                                    hitungGolDarah(GolDarah.golBpos, stokdarah),
                                'O +':
                                    hitungGolDarah(GolDarah.golOpos, stokdarah),
                                'AB +': hitungGolDarah(
                                    GolDarah.golABpos, stokdarah),
                              },
                              colorList: [
                                Color(0xFFFE0024),
                                Color(0xFFDF344C),
                                Color(0xFFA74D5A),
                                Color(0xFF793A43),
                              ],
                              legendPosition: LegendPosition.left,
                              chartLegendSpacing: 20,
                              decimalPlaces: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              return showDialog(
                                context: context,
                                builder: (context) => JumlahGolonganDarah(
                                  title:
                                      'Jumlah Golongan Darah Negatif dari ${stokdarah.length} Rumah Sakit di Jakarta',
                                  jumlahGolonganDarahA:
                                      ' Jumlah Golongan Darah A- : ${hitungGolDarah(GolDarah.golAneg, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahB:
                                      ' Jumlah Golongan Darah B- : ${hitungGolDarah(GolDarah.golBneg, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahO:
                                      ' Jumlah Golongan Darah O- : ${hitungGolDarah(GolDarah.golOneg, stokdarah).toInt()} Stok',
                                  jumlahGolonganDarahAB:
                                      ' Jumlah Golongan Darah AB- : ${hitungGolDarah(GolDarah.golABneg, stokdarah).toInt()} Stok',
                                ),
                              );
                            },
                            child: PieChart(
                              dataMap: {
                                'A -':
                                    hitungGolDarah(GolDarah.golAneg, stokdarah),
                                'B -':
                                    hitungGolDarah(GolDarah.golBneg, stokdarah),
                                'O -':
                                    hitungGolDarah(GolDarah.golOneg, stokdarah),
                                'AB -': hitungGolDarah(
                                    GolDarah.golABneg, stokdarah),
                              },
                              colorList: [
                                Color(0xFFFE0024),
                                Color(0xFFDF344C),
                                Color(0xFFA74D5A),
                                Color(0xFF793A43),
                              ],
                              legendPosition: LegendPosition.left,
                              chartLegendSpacing: 20,
                              decimalPlaces: 1,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Loading2(width: 50, height: 50));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
