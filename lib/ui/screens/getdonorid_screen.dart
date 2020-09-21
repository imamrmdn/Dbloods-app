part of 'screens.dart';

class GetDonorIdScreen extends StatelessWidget {
  final EventDonor eventDonor;

  GetDonorIdScreen(this.eventDonor);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToEventDetailScreen(eventDonor));
        return;
      },
      child: Scaffold(
        body: Center(
          child: Text('get donor id screen'),
        ),
      ),
    );
  }
}
