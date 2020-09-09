part of '../widgets.dart';

class Loading2 extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  Loading2({this.height, this.width, this.color = mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: SpinKitThreeBounce(
        color: color,
      ),
    );
  }
}
