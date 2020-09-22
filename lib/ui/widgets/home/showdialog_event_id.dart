part of '../widgets.dart';

class AlertDialogAnimation2 extends StatefulWidget {
  final String message;
  final Image image;
  final Function onPressed1;
  final Function onPressed2;

  AlertDialogAnimation2(
      {this.message, this.image, this.onPressed1, this.onPressed2});

  @override
  _AlertDialogAnimation2State createState() => _AlertDialogAnimation2State();
}

class _AlertDialogAnimation2State extends State<AlertDialogAnimation2>
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
            height: SizeConfig.defaultHeight / 3.5,
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          onPressed: widget.onPressed1,
                          child: Text('Batal', style: redTextFont)),
                      FlatButton(
                          onPressed: widget.onPressed2,
                          child: Text('Ya',
                              style: blackTextFont.copyWith(
                                  color: Colors.lightBlue))),
                    ],
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
