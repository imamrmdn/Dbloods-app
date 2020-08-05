part of '../widgets.dart';

class NamaDanGolDarah extends StatelessWidget {
  final String text1;
  final String text2;

  NamaDanGolDarah({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text1,
          style: blackTextFontt2,
        ),
        Text(
          text2,
          style: blackTextFontt2,
        ),
      ],
    );
  }
}
