part of '../widgets.dart';

class ButtonNext extends StatelessWidget {
  final Function onPressed;

  ButtonNext({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.sizeHeight2 * 6, //50
      child: RaisedButton(
        color: mainColor,
        splashColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius8,
        ),
        child: Text('Next',
            style: whiteTextFont.copyWith(fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
}
