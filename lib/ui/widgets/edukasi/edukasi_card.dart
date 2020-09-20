part of '../widgets.dart';

class EdukasiCard extends StatefulWidget {
  final Edukasi edukasi;
  final Function onTap;

  EdukasiCard({this.edukasi, this.onTap});

  @override
  _EdukasiCardState createState() => _EdukasiCardState();
}

class _EdukasiCardState extends State<EdukasiCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        splashColor: mainColor,
        onTap: widget.onTap,
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
                      "${widget.edukasi.title}",
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text("Penulis: ${widget.edukasi.penulis}",
                      style: blackTextFont2)
                ],
              ),
              SizedBox(width: 20),
              cachedNetworkImage(widget.edukasi.gambar, this),
            ],
          ),
        ),
      ),
    );
  }
}
