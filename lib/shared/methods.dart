part of 'shareds.dart';

//imagepicker to use registration or signup screen and edit profile screen
Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}

//calculate age method
String formatAge(String date) {
  final yearsNow = DateTime.now().year;
  final yearsAgo = int.parse(date.split('-').last);

  final age = yearsNow - yearsAgo;
  return age.toString();
}

//
// String validatePassword(String value) {
//   Pattern pattern =
//       ...;
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(value))
//     return 'Enter Valid Email';
//   else
//     return null;
// }

//
extension StringExtension on String {
  capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}

//
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
