part of '../widgets.dart';

//
void showFlushBar(context,
    {Icon icon = const Icon(Icons.info_outline),
    String text = 'Semua Field Harus Diisi',
    Color color = Colors.yellow}) {
  Flushbar(
    duration: Duration(seconds: 2),
    icon: icon,
    messageText: Text(text, style: blackTextFont),
    backgroundColor: color,
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);
}

//
void showFlushbarCustom(context,
    {String text,
    String title,
    Color color = Colors.yellow,
    Widget icon = const Icon(Icons.info_outline)}) {
  Flushbar(
    duration: Duration(seconds: 2),
    icon: icon,
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(10),
    borderRadius: 8.0,
    titleText:
        Text(title, style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
    messageText: Text(text, style: blackTextFont),
    backgroundColor: color,
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);
}
