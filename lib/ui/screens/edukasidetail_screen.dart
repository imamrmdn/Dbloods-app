part of 'screens.dart';

class EdukasiDetailScreen extends StatelessWidget {
  final Edukasi edukasiDonor;

  EdukasiDetailScreen(this.edukasiDonor);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToMainScreen(bottomNavBarIndex: 1));
        return;
      },
      child: Scaffold(
        body: Center(child: Text('${edukasiDonor.deskripsi}')),
      ),
    );
  }
}
