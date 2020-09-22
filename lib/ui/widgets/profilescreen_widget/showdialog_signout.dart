part of '../widgets.dart';

class ShowDialogSignOut extends StatelessWidget {
  final Function onPressed1;
  final Function onPressed2;

  ShowDialogSignOut({this.onPressed1, this.onPressed2});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius10),
      title: Text('Apakah anda yakin ingin Sign Out?',
          style: blackTextFont.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18)),
      actions: <Widget>[
        FlatButton(
          onPressed: onPressed1,
          child: Text('Cancel', style: redTextFont),
        ),
        FlatButton(
            onPressed: onPressed2,
            child: Text('Yes',
                style: blackTextFont.copyWith(color: Colors.lightBlue))),
      ],
    );
  }
}
