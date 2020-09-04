part of '../widgets.dart';

class WhatsAppButton extends StatelessWidget {
  final String number = '+6285781747187';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 70.0),
      child: FloatingActionButton(
        onPressed: () async {
          await launch(
              'https://wa.me/$number?text=Hello Admin Mau menanyakan tentang ketersediaan stok darah dong');
        },
        backgroundColor: mainColor,
        child: Icon(
          MdiIcons.whatsapp,
        ),
      ),
    );
  }
}
