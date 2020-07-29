part of 'screens.dart';

class ProfileScreen extends StatelessWidget {
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
            AuthServices.signOut();
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 150.0,
              left: SizeConfig.defaultWidth / 2.5,
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/signout.svg', height: 100)
              ],
            ),
          ),
        )
      ],
    );
  }
}
