part of '../widgets.dart';

class CardCustomInformasi extends StatefulWidget {
  final Informasi informasi;
  final Function onTap;

  CardCustomInformasi({this.informasi, this.onTap});

  @override
  _CardCustomInformasiState createState() => _CardCustomInformasiState();
}

class _CardCustomInformasiState extends State<CardCustomInformasi>
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
            children: <Widget>[
              cachedNetworkImage(widget.informasi.gambar, this),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultWidth - 2 * 20.0 - 118,
                    child: Text(
                      widget.informasi.title,
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('sumber: ${widget.informasi.sumber}',
                      style: blackTextFont2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
