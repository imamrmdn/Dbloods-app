part of '../widgets.dart';

class Loading extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  Loading({
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: SpinKitDoubleBounce(
        color: color,
      ),
    );
  }
}
