part of '../widgets.dart';

class CekStokDarah extends StatelessWidget {
  final String title;
  final String golDarahApos;
  final String golDarahBpos;
  final String golDarahOpos;
  final String golDarahABpos;
  final String golDarahAneg;
  final String golDarahBneg;
  final String golDarahOneg;
  final String golDarahABneg;

  CekStokDarah({
    this.title,
    this.golDarahApos,
    this.golDarahBpos,
    this.golDarahOpos,
    this.golDarahABpos,
    this.golDarahAneg,
    this.golDarahBneg,
    this.golDarahOneg,
    this.golDarahABneg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: borderRadius10),
            title: Text(title),
            content: Container(
              height: SizeConfig.sizeHeight * 2.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahApos, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahBpos, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahOpos, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahABpos, style: blackTextFont),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahAneg, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahBneg, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahOneg, style: blackTextFont),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      iconDbloods2,
                      Text(golDarahABneg, style: blackTextFont),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Row(
        children: <Widget>[
          Text('Cek Stok Darah', style: blackTextFont),
          Icon(Icons.arrow_forward_ios, size: 15),
        ],
      ),
    );
  }
}
