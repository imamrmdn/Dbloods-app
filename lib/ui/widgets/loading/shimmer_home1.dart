part of '../widgets.dart';

class LoadingShimmerHome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Row(
        children: <Widget>[
          Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: mainColor,
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 12.0),
              Container(
                height: 15,
                width: SizeConfig.defaultWidth / 2,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 15,
                width: SizeConfig.defaultWidth / 1.8,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 50.0,
      color: whiteColor,
      duration: Duration(seconds: 5),
    );
  }
}
