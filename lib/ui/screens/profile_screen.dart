part of 'screens.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Stack(
      children: <Widget>[
        BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) => (userState is UserLoaded)
              ? ProfileIdentity(
                  nama: '${userState.user.nama}',
                  golDarah: 'Gol Darah ${userState.user.golDarah}',
                  email: '${userState.user.email}',
                  umur: 'Umur ${formatAge(userState.user.tanggalLahir)} tahun',
                )
              : Loading(
                  color: mainColor,
                  height: 50,
                  width: 50,
                ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: SizeTheme.sizekVertical * 4),
            height: SizeTheme.sizekVertical * 20, //200
            width: SizeTheme.sizeHorizontal * 200, //200
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
            ),
            child: Container(
              height: SizeTheme.sizekVertical * 20, //200
              width: SizeTheme.sizeHorizontal * 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: mainColor, width: 1),
                image: DecorationImage(
                  image: AssetImage('assets/user_profile.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
