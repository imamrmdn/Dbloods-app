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
  final yearsAgo = int.parse(date);

  final age = yearsNow - yearsAgo;
  print('umur $age tahun');
  return age.toString();
}
