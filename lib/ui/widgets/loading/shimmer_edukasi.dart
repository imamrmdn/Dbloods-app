part of '../widgets.dart';

class LoadingShimmerEdukasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) {
        return Card(
          elevation: 2,
          child: Container(
            height: 120,
            width: SizeConfig.defaultWidth,
            padding: EdgeInsets.all(20),
            child: Shimmer.fromColors(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: borderRadius8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //
                        Container(
                          height: 25,
                          width: SizeConfig.defaultWidth / 1.9,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: borderRadius8,
                          ),
                        ),
                        //
                        Container(
                          height: 10,
                          width: SizeConfig.defaultWidth / 3,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: borderRadius8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: borderRadius8,
                      ),
                    ),
                  ],
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]),
          ),
        );
      },
    );
  }
}
