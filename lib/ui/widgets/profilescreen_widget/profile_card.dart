part of '../widgets.dart';

class ProfileCard extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final String nama;
  final String golDarah;
  final String umur;
  final String email;

  ProfileCard({
    this.image,
    this.nama,
    this.golDarah,
    this.umur,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //poto profile
        Container(
          padding: EdgeInsets.all(3),
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(color: blackColor, width: 1),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: <Widget>[
              Loading(color: blackColor),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30),
        //nama,goldarah,pekerjaan,email
        SizedBox(
          width: SizeConfig.defaultWidth - 2 * 20 - 30 - 140 - 30 - 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                nama,
                style: blackTextFont.copyWith(fontSize: 15.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(golDarah, style: blackTextFont.copyWith(fontSize: 15.0)),
              Text(umur, style: blackNumberFont2.copyWith(fontSize: 15.0)),
              Text(
                email,
                style: blackTextFont,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
