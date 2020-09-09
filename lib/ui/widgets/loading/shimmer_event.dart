part of '../widgets.dart';

class LoadingShimmerEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) {
        return Card(
          elevation: 3,
          child: Container(
            width: SizeTheme.sizeHorizontal,
            height: 120,
            padding: EdgeInsets.all(15),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      container(30, 30),
                      SizedBox(width: 15),
                      container(30, SizeConfig.defaultWidth / 1.4),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      container(30, 30),
                      SizedBox(width: 15),
                      container(30, SizeConfig.defaultWidth / 2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  container(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius5,
      ),
    );
  }
}
