part of 'screens.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, userState) => Stack(
        children: <Widget>[
          Container(
            width: SizeConfig.defaultWidth,
            height: SizeConfig.defaultHeight,
            color: whiteColor,
          ),
          Container(
            width: SizeConfig.defaultWidth,
            height: 104,
            color: mainColor,
          ),
          PotoProfileWidget(),
          (userState is UserLoaded)
              ? SafeArea(
                  minimum: minimumMarginRightLeft2,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.defaultHeight / 10 * 2.5, //250
                      bottom: SizeConfig.defaultHeight / 10, //100
                    ),
                    width: SizeConfig.defaultWidth,
                    height: SizeConfig.defaultHeight,
                    child: Column(
                      children: <Widget>[
                        NamaDanGolDarah(
                          text1: '${userState.user.nama}',
                          text2: 'Gol Darah ${userState.user.golDarah}',
                        ),
                        SizedBox(height: 30),
                        EmailDanTanggalLahir(
                          text3: '${userState.user.email}',
                          text4:
                              'umur ${formatAge(userState.user.tanggalLahir)} tahun',
                        ),
                        SizedBox(height: 30),
                        SignOutWidget(
                          onTap: () {
                            return showDialog(
                              context: context,
                              builder: (context) => ShowDialogSignOut(
                                onPressed1: () {
                                  Navigator.of(context).pop();
                                },
                                onPressed2: () {
                                  Navigator.of(context).pop();
                                  context.bloc<UserBloc>().add(SignOut());
                                  AuthServices.signOut();
                                  Flushbar(
                                    duration: Duration(seconds: 1),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.green,
                                    icon: Icon(MdiIcons.check),
                                    leftBarIndicatorColor: mainColor,
                                    messageText: Text(
                                        'Anda telah Sign Out dari Dbloods'),
                                  )..show(context);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Loading(
                  color: mainColor,
                ),
        ],
      ),
    );
  }
}
