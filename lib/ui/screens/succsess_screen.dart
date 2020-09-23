part of 'screens.dart';

class SuccesScreen extends StatelessWidget {
  final EventId eventId;
  final EventIdTransaction transaction;

  SuccesScreen(this.eventId, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: processingEventId(context),
          builder: (_, snapshot) => (snapshot.connectionState ==
                  ConnectionState.done)
              ? SafeArea(
                  minimum: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/dbloods_congrats.png',
                          height: 200,
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Yeay Kamu Berhasil\nMengikuti Event Donor',
                          style: blackTextFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 120),
                        ButtonNext(
                          text: 'Lihat Riwayat Donormu',
                          onPressed: () {},
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Mau Mengikut Event Lagi?',
                                style: blackTextFont),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                context
                                    .bloc<ScreenBloc>()
                                    .add(GoToMainScreen(bottomNavBarIndex: 0));
                              },
                              child:
                                  Text('Kembali ke Home.', style: redTextFont),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Loading(
                    color: mainColor,
                    height: 50,
                    width: 50,
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> processingEventId(BuildContext context) async {
    context.bloc<EventidBloc>().add(FollowEvent(eventId, transaction.userID));

    await EventIdTransactionServices.saveTransaction(transaction);
  }
}
