part of '../widgets.dart';

class Button extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final Function onTap;
  final Text text;

  Button({
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height, //65
      child: Material(
        color: mainColor,
        borderRadius: borderRadius8,
        child: InkWell(
          onTap: onTap,
          splashColor: accentColor4,
          borderRadius: borderRadius8,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
