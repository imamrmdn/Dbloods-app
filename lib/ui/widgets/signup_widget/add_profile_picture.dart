part of '../widgets.dart';

class AddProfilePicture extends StatelessWidget {
  final ImageProvider<dynamic> image1;
  final ImageProvider<dynamic> image2;
  final Function onTap;

  AddProfilePicture({this.image1, this.image2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.sizeHeight2 * 2), //20
        width: SizeConfig.sizeHeight2 * 10,
        height: SizeConfig.sizeHeight2 * 11.5,
        child: Stack(
          children: <Widget>[
            Container(
              height: SizeConfig.sizeHeight2 * 10, //90
              width: SizeConfig.sizeHeight2 * 10, //90
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: mainColor, width: 1),
                image: DecorationImage(
                  image: image1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: SizeConfig.sizeHeight2 * 3, //28
                  width: SizeConfig.sizeHeight2 * 3, //28
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
