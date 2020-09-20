part of '../widgets.dart';

class JumlahGolonganDarah extends StatelessWidget {
  final String title;
  final String jumlahGolonganDarahA;
  final String jumlahGolonganDarahB;
  final String jumlahGolonganDarahO;
  final String jumlahGolonganDarahAB;

  JumlahGolonganDarah({
    this.title,
    this.jumlahGolonganDarahA,
    this.jumlahGolonganDarahB,
    this.jumlahGolonganDarahO,
    this.jumlahGolonganDarahAB,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius10),
      title: Text(title),
      content: SizedBox(
        height: SizeConfig.sizeHeight * 1.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                iconDbloods,
                Text(jumlahGolonganDarahA, style: blackNumberFont3),
              ],
            ),
            Row(
              children: <Widget>[
                iconDbloods,
                Text(jumlahGolonganDarahB, style: blackNumberFont3),
              ],
            ),
            Row(
              children: <Widget>[
                iconDbloods,
                Text(jumlahGolonganDarahO, style: blackNumberFont3),
              ],
            ),
            Row(
              children: <Widget>[
                iconDbloods,
                Text(jumlahGolonganDarahAB, style: blackNumberFont3),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }
}
