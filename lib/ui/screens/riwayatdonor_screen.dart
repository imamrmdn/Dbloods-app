part of 'screens.dart';

class RiwayatDonorScreen extends StatefulWidget {
  @override
  _RiwayatDonorScreenState createState() => _RiwayatDonorScreenState();
}

class _RiwayatDonorScreenState extends State<RiwayatDonorScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToMainScreen(bottomNavBarIndex: 3));
        return;
      },
      child: Container(
        color: mainColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              title: Text('Riwayat Donor Mu', style: whiteTextFont),
              elevation: 0,
              backgroundColor: mainColor,
            ),
            body: Center(
              child: Text('halaman Riwayat Donor'),
            ),
          ),
        ),
      ),
    );
  }
}
