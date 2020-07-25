part of 'screens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // final yearsAgo = DateTime.now().subtract(Duration(days: 365 * 22)).year;
    // print(yearsAgo);
    // final now = DateTime.now().year;
    // final age = now - yearsAgo;
    // print(age);

    // String yearNow = DateFormat('yyyy').format(DateTime.now());
    // int.parse(yearNow);
    // print(yearNow);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Column(
                        children: <Widget>[
                          Text(userState.user.nama),
                          Text(userState.user.pekerjaan),
                          Text('tanggal lahir: ' + userState.user.tanggalLahir),
                        ],
                      )
                    : Text('')),
            RaisedButton(
              child: Icon(Icons.backspace),
              onPressed: () {
                AuthServices.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
