part of '../widgets.dart';

class EmailDanTanggalLahir extends StatelessWidget {
  final String text3;
  final String text4;

  EmailDanTanggalLahir({this.text3, this.text4});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text3,
          style: blackTextFontt2,
        ),
        Text(
          text4,
          style: blackTextFontt2,
        ),
      ],
    );
  }
}
