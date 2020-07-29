part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.defaultWidth,
          height: SizeConfig.defaultHeight,
          color: mainColor,
        ),
        Container(
          width: SizeConfig.defaultWidth,
          height: 104,
          padding: EdgeInsets.only(top: 30.0, left: 50.0),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              return Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: greyColor, width: 1),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Loading(color: blackColor, width: 20, height: 20),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: (userState.user.profilePicture == " ")
                              ? SvgPicture.asset('assets/User_Profile.svg')
                              : Image.network(userState.user.profilePicture),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Selamat datang, ${userState.user.nama}',
                          style: whiteTextFont),
                      Text('Mau ikut event donor atau cari stok darah ?',
                          style: whiteTextFont),
                    ],
                  )
                ],
              );
            } else {
              return SvgPicture.asset('assets/User_Profile.svg');
            }
          }),
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
