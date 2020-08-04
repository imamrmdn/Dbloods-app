part of 'screens.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
        GestureDetector(
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
                    messageText: Text('Anda telah Sign Out dari Dbloods'),
                  )..show(context);
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 150.0,
              left: SizeConfig.defaultWidth / 2.5,
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/signout.svg', height: 30),
                SizedBox(width: 10),
                Text('Sign Out', style: blackTextFont)
              ],
            ),
          ),
        )
      ],
    );
  }
}
