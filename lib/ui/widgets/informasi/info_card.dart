part of '../widgets.dart';

class CardCustomInformasi extends StatelessWidget {
  final Informasi informasi;

  CardCustomInformasi({this.informasi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        splashColor: mainColor,
        onTap: () {},
        child: Container(
          height: 120,
          width: SizeConfig.defaultWidth,
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: borderRadius8,
                  image: DecorationImage(
                    image: NetworkImage((informasi.gambar != '')
                        ? '${informasi.gambar}'
                        : 'https://merahputih.com/media/c0/0e/d2/c00ed25b79766b3cafca6962d62714ad.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultWidth - 2 * 20.0 - 118,
                    child: Text(
                      '${informasi.title}',
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('sumber: ${informasi.sumber}', style: blackTextFont2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
