part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
          width: SizeConfig.defaultWidth,
          height: SizeConfig.defaultHeight,
          color: mainColor,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: whiteColor, width: 1),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Loading(color: blackColor),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: (userState.user.profilePicture == "")
                                      ? AssetImage('assets/user_profile.png')
                                      : NetworkImage(
                                          userState.user.profilePicture),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 12.0),
                        SizedBox(
                          width: SizeConfig.defaultWidth -
                              2.0 * 30.0 -
                              65.0 -
                              12.0 -
                              20.0,
                          child: Text('Selamat datang, ${userState.user.nama}',
                              style: whiteTextFont.copyWith(
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.clip),
                        ),
                        Text('Mau ikut event donor atau cari stok darah?',
                            style: whiteTextFont.copyWith(
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                );
              } else {
                return Loading2();
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 103),
          height: SizeConfig.defaultHeight,
          width: SizeConfig.defaultWidth,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              margin: EdgeInsets.only(top: 85, bottom: 80),
              child: isLoading
                  ? Loading()
                  : ListView(
                      children: <Widget>[
                        SizedBox(height: 200),
                        SvgPicture.asset(
                          'assets/server_down.svg',
                          height: 200,
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Text(
                                'Belum ada jadwal/event untuk bulan ini.',
                                style: blackTextFont)),
                      ],
                    ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 103),
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(50),
              topRight: const Radius.circular(50),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                  child: SvgPicture.asset('assets/logo.svg'),
                ),
                SizedBox(width: 10),
                Text(
                  'Jadwal atau Event Donor',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 180, left: 12, right: 12),
          width: MediaQuery.of(context).size.width,
          height: 3,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }
}
