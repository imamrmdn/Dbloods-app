part of 'screens.dart';

class SuccesScreen extends StatelessWidget {
  final EventId eventId;
  final User user;

  SuccesScreen(this.eventId, this.user);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          // future: ,
          builder: (_, snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Center(
                      child: RaisedButton(
                      onPressed: () {},
                    ))
                  : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  // Future<void> processingEventId(BuildContext context) async {
  //   context.bloc<EventidBloc>().add(FollowEvent(eventId, ));
  // }
}
