part of '../widgets.dart';

class Loading3 extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  Loading3({this.height, this.width, this.color = mainColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SpinKitChasingDots(
        color: color,
      ),
    );
  }
}
