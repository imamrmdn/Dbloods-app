part of '../widgets.dart';

class ButtonNext extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;

  ButtonNext({this.onPressed, this.text = 'Next', this.color = mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.sizeHeight2 * 6, //50
      width: SizeConfig.defaultWidth,
      child: RaisedButton(
        color: color,
        splashColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius8,
        ),
        child: Text(text,
            style: whiteTextFont.copyWith(fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
}
