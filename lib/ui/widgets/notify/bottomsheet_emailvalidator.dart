part of '../widgets.dart';

//

void showBottomSheetEmailValidator(context, {Function onPressed}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) => Container(
      height: SizeTheme.sizekVertical * 40,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 50.0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.cancel, color: mainColor, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 60.0),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/notify_email.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text(
                    'Email yang anda masukan sudah digunakan oleh akun lain !',
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: SizeConfig.defaultWidth / 1.2,
                height: SizeTheme.sizekVertical * 5,
                child: RaisedButton(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius10,
                  ),
                  child: Text(
                    'Kembali ke Sign Up',
                    style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
                  ),
                  onPressed: onPressed,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
