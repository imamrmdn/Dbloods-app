part of '../widgets.dart';

class PotoProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.all(10.0),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor,
        ),
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: mainColor, width: 1),
            image: DecorationImage(
              image: AssetImage('assets/user_profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
