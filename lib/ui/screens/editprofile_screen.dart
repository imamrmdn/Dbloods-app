part of 'screens.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: blackColor),
                onPressed: () {
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToMainScreen(bottomNavBarIndex: 3));
                },
              ),
              title: Text('Edit Profile', style: blackTextFont),
              elevation: 0,
              backgroundColor: whiteColor,
            ),
            body: Center(
              child: Text('halaman Edit Profile'),
            ),
          ),
        ),
      ),
    );
  }
}
