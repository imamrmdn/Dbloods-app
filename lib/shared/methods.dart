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
String validatePassword(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

//
