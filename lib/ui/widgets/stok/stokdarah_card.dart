part of '../widgets.dart';

class StokDarahCard extends StatelessWidget {
  final StokDarah stokDarah;
  final Image image;
  final String golDarah = 'Gol Darah';

  StokDarahCard({
    this.stokDarah,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 170.0,
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
                    style: blackTextFont.copyWith(fontWeight: FontWeight.w400),
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
                  child: Text(
                    "${stokDarah.alamatrs}.",
                    style: blackTextFont2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                updateStokDarah(),
                CekStokDarah(
                  title:
                      'Jumlah Stok Darah yang tersedia\ndi ${stokDarah.namars}:',
                  golDarahApos:
                      ' Golongan Darah A+ : ${cekStokDarah(stokDarah.golApos)}',
                  golDarahBpos:
                      ' Golongan Darah B+ : ${cekStokDarah(stokDarah.golBpos)}',
                  golDarahOpos:
                      ' Golongan Darah O+ : ${cekStokDarah(stokDarah.golOpos)}',
                  golDarahABpos:
                      ' Golongan Darah AB+ : ${cekStokDarah(stokDarah.golABpos)}',
                  golDarahAneg:
                      ' Golongan Darah A- : ${cekStokDarah(stokDarah.golAneg)}',
                  golDarahBneg:
                      ' Golongan Darah B- : ${cekStokDarah(stokDarah.golBneg)}',
                  golDarahOneg:
                      ' Golongan Darah O- : ${cekStokDarah(stokDarah.golOneg)}',
                  golDarahABneg:
                      ' Golongan Darah AB- : ${cekStokDarah(stokDarah.golABneg)}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  updateStokDarah() {
    return Row(
      children: <Widget>[
        Icon(Icons.schedule),
        SizedBox(width: 5),
        Text(
            'terakhir diupdate tanggal ${formatDate(DateTime.parse(stokDarah.updatedAt))}',
            style: blackNumberFont3),
      ],
    );
  }
}
