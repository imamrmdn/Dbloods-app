part of 'screens.dart';

class EdukasiDetailScreen extends StatelessWidget {
  final Edukasi edukasiDonor;

  EdukasiDetailScreen(this.edukasiDonor);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToMainScreen(bottomNavBarIndex: 1, initialIndex: 1));
        return;
      },
      child: Container(
        color: mainColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,
            body: Column(
              children: <Widget>[
                Image.network('${edukasiDonor.gambar}'),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Penulis: ${edukasiDonor.penulis}',
                        style: blackTextFont.copyWith(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${formatDate2(edukasiDonor.createdAt)}',
                        style: blackTextFont.copyWith(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          ' ${edukasiDonor.deskripsi.trim()}',
                          style: blackTextFont,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
