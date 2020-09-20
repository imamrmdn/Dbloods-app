part of '../widgets.dart';

class SignOutWidget extends StatelessWidget {
  final Function onTap;

  SignOutWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/signout.svg', height: 30),
          SizedBox(width: 10),
          Text('Sign Out',
              style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
