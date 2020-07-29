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
                builder: (context) => AlertDialog(
                      shape:
                          RoundedRectangleBorder(borderRadius: borderRadius10),
                      title: Text('Apakah anda yaking ingin SignOut?'),
                      content: Text('ya saya yakin ingin SignOut.'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('cancel'),
                        ),
                        FlatButton(
                          onPressed: () {
                            context.bloc<UserBloc>().add(SignOut());
                            AuthServices.signOut();
                          },
                          child: Text('Yes'),
                        )
                      ],
                    ));
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
