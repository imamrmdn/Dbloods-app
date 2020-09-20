part of '../widgets.dart';

class DateFieldSignUp extends StatelessWidget {
  final TextEditingController controller;
  final format = DateFormat("dd-MM-yyyy");

  DateFieldSignUp({
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return DateTimeField(
      controller: controller,
      cursorColor: Colors.red[300],
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.date_range),
        hoverColor: Colors.red[300],
        hintText: 'Tanggal lahir',
        hintStyle: blackTextFont,
      ),
      format: format,
      onShowPicker: (context, currentValue) async {
        return await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime.now(),
        );
      },
    );
  }
}
