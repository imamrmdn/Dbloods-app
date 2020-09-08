part of '../widgets.dart';

class EdukasiCard extends StatelessWidget {
  final Edukasi edukasi;
  final Function onTap;

  EdukasiCard({this.edukasi, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        splashColor: mainColor,
        onTap: onTap,
        child: Container(
          height: 120,
          width: SizeConfig.defaultWidth,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Image.asset(
                      'assets/book2.png',
                      height: 40,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultWidth - 2 * 20.0 - 118 - 41,
                    child: Text(
                      "${edukasi.title}",
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text("Penulis: ${edukasi.penulis}", style: blackTextFont2)
                ],
              ),
              SizedBox(width: 20),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: borderRadius8,
                  image: DecorationImage(
                    image: (edukasi.gambar != ' ')
                        ? NetworkImage(edukasi.gambar)
                        : NetworkImage(
                            'https://merahputih.com/media/c0/0e/d2/c00ed25b79766b3cafca6962d62714ad.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
