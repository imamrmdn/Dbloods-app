part of '../widgets.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: ListView.builder(
          itemCount: 14,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Container(
                width: SizeConfig.defaultWidth,
                height: 170.0,
              ),
            );
          }),
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
    );
  }
}
