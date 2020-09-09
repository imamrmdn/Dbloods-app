part of '../widgets.dart';

class LoadingShimmerStokDarah extends StatelessWidget {
  final double height;

  LoadingShimmerStokDarah({this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          color: whiteColor,
          child: Container(
            height: height,
            padding: EdgeInsets.all(10),
            child: Shimmer.fromColors(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  containerShimmer(25, 200),
                  SizedBox(height: 10),
                  containerShimmer(30, SizeConfig.defaultWidth / 1.4),
                  SizedBox(height: 10),
                  containerShimmer(25, 130),
                  SizedBox(height: 10),
                  containerShimmer(20, SizeConfig.defaultWidth),
                ],
              ),
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
            ),
          ),
        );
      },
    );
  }

  containerShimmer(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
