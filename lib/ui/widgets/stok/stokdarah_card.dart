part of '../widgets.dart';

class StokDarahCard extends StatelessWidget {
  final StokDarah stokDarah;
  final Function onTap;
  final Image image;

  StokDarahCard({
    this.stokDarah,
    this.onTap,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        splashColor: mainColor,
        onTap: onTap,
        child: Container(
          height: 180.0,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  image,
                  SizedBox(width: 10),
                  SizedBox(
                    width: SizeConfig.defaultWidth - 2 * 20 - 65 - 5.1,
                    child: Text(
                      '${stokDarah.namars}',
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                      width: SizeConfig.defaultWidth - 2 * 20 - 65 - 5.1,
                      child: Text("${stokDarah.alamatrs}.",
                          maxLines: 2, overflow: TextOverflow.ellipsis)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('A+ = ${stokDarah.golApos}'),
                  Text('B+ = ${stokDarah.golBpos}'),
                  Text('O+ = ${stokDarah.golOpos}'),
                  Text('AB+ = ${stokDarah.golABpos}'),
                  Text('A- = ${stokDarah.golAneg}'),
                  Text('B- = ${stokDarah.golBneg}'),
                  Text('O- = ${stokDarah.golOneg}'),
                  Text('AB- = ${stokDarah.golABneg}'),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width: 5),
                  Text(
                      'terakhir diupdate tanggal ${formatDate(DateTime.parse(stokDarah.updatedAt))}',
                      style: blackNumberFont3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
