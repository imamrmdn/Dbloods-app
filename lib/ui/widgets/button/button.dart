part of '../widgets.dart';

class Button extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final Function onTap;
  final Widget text;
  final Color color;

  Button({
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height, //65
      child: Material(
        color: color,
        borderRadius: borderRadius8,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blue,
          borderRadius: borderRadius8,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
