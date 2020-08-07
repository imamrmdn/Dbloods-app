part of '../widgets.dart';

//
void showBottomSheetEmailValidator(context, {String text, Function onPressed}) {
  SizeTheme().init(context);

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
        padding:
            EdgeInsets.fromLTRB(8.0, 8.0, 8.0, SizeTheme.sizekVertical * 5),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.cancel,
                      color: mainColor, size: SizeTheme.sizekVertical * 3),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: SizeTheme.sizekVertical * 7),
                height: SizeTheme.sizekVertical * 20,
                width: SizeTheme.sizeHorizontal * 50,
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
                margin: EdgeInsets.only(top: SizeTheme.sizekVertical * 5),
                child: Text(text,
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
