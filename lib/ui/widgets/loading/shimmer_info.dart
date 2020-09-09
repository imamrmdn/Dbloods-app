part of '../widgets.dart';

class LoadingShimmerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Container(
            height: 120,
            width: SizeConfig.defaultWidth,
            padding: EdgeInsets.all(20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Row(
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: borderRadius8,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: SizeConfig.defaultWidth / 1.5,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: borderRadius8,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: SizeConfig.defaultWidth / 3,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: borderRadius8,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
