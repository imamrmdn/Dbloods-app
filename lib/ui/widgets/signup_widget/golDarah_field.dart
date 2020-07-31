part of '../widgets.dart';

class GolDarahFieldSignUp extends StatefulWidget {
  @override
  _GolDarahFieldSignUpState createState() => _GolDarahFieldSignUpState();
}

class _GolDarahFieldSignUpState extends State<GolDarahFieldSignUp> {
  GolDarah golDarah;
  List<GolDarah> dataGolDarah = [
    GolDarah(golDarah: 'tidak tahu'),
    GolDarah(golDarah: 'A +'),
    GolDarah(golDarah: 'B +'),
    GolDarah(golDarah: 'O +'),
    GolDarah(golDarah: 'AB +'),
    GolDarah(golDarah: 'A -'),
    GolDarah(golDarah: 'B -'),
    GolDarah(golDarah: 'O -'),
    GolDarah(golDarah: 'AB -'),
  ];

  List<DropdownMenuItem> generateItems(List<GolDarah> dataGolDarah) {
    List<DropdownMenuItem> items = [];
    for (var item in dataGolDarah) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.golDarah),
        ),
      );
    }

    return items;
  }

  void selectedGolDarah(item) {
    setState(() {
      golDarah = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: blackColor,
    );
    return DropdownButtonFormField(
      hint: Text('Gol Darah', style: blackTextFont),
      items: generateItems(dataGolDarah),
      onChanged: selectedGolDarah,
      style: textStyle,
    );
  }
}

class GolDarah {
  String golDarah;

  GolDarah({this.golDarah});
}
