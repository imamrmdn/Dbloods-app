part of 'screens.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: <Widget>[
          //column
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
                  padding: EdgeInsets.fromLTRB(20, 150, 20, 70),
                  child: ProfileMenu(),
                ),
              ),
            ],
          ),
          //heading profile identity
          Card(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius8,
            ),
            child: Container(
              height: SizeConfig.defaultHeight / 5,
              width: SizeConfig.defaultWidth,
              padding: EdgeInsets.all(30),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) {
                  if (userState is UserLoaded) {
                    if (imageFileToUpload != null) {
                      uploadImage(imageFileToUpload).then((downloadURL) {
                        imageFileToUpload = null;
                        context
                            .bloc<UserBloc>()
                            .add(UpdateData(profileImage: downloadURL));
                      });
                    }
                    return ProfileCard(
                      image: (userState.user.profilePicture == "")
                          ? AssetImage('assets/user_profile.png')
                          : NetworkImage(userState.user.profilePicture),
                      nama: 'Nama: ${userState.user.nama}',
                      golDarah: 'Gol Darah: ${userState.user.golDarah}',
                      umur:
                          'Umur: ${formatAge(userState.user.tanggalLahir)} tahun',
                      email: '${userState.user.email}',
                    );
                  } else {
                    return Center(
                      child: Loading2(height: 40.0, width: 40.0),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
