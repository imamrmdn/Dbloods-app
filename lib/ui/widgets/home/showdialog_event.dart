part of '../widgets.dart';

class AlertDialogAnimation extends StatefulWidget {
  final String message;
  final Image image;

  AlertDialogAnimation({this.message, this.image});

  @override
  _AlertDialogAnimationState createState() => _AlertDialogAnimationState();
}

class _AlertDialogAnimationState extends State<AlertDialogAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: SizeConfig.defaultHeight / 4,
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultWidth / 7),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: borderRadius10,
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  widget.image,
                  Text(
                    widget.message,
                    style: blackTextFont,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
