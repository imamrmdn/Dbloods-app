part of 'shareds.dart';

//imagepicker to use registration or signup screen and edit profile screen
Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}

//upload image
Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  //uploadfileimage
  StorageUploadTask taskUpload = ref.putFile(image);
  StorageTaskSnapshot snapshot = await taskUpload.onComplete;
  var downloadUrl = await snapshot.ref.getDownloadURL();

  return downloadUrl;
}

//calculate age method
String formatAge(String date) {
  final yearsNow = DateTime.now().year;
  final yearsAgo = int.parse(date.split('-').last);

  final age = yearsNow - yearsAgo;
  return age.toString();
}

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
      text: newValue.text.capitalize(),
      selection: newValue.selection,
    );
  }
}

//
void handleGolDarah({String currentGolDarah, String golDarah}) {
  if (currentGolDarah == null && golDarah != null) {
    currentGolDarah = golDarah;
  }
}

//
//todo: function call whatsapp

//todo: calculate golongan darah
enum GolDarah {
  golApos,
  golBpos,
  golOpos,
  golABpos,
  golAneg,
  golBneg,
  golOneg,
  golABneg,
}

double hitungGolDarah(GolDarah golDarah, List<StokDarah> stokdarah) {
  switch (golDarah) {
    case GolDarah.golApos:
      return stokdarah
          .map((item) => item.golApos)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golBpos:
      return stokdarah
          .map((item) => item.golBpos)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golOpos:
      return stokdarah
          .map((item) => item.golOpos)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golABpos:
      return stokdarah
          .map((item) => item.golABpos)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golAneg:
      return stokdarah
          .map((item) => item.golAneg)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golBneg:
      return stokdarah
          .map((item) => item.golBneg)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    case GolDarah.golOneg:
      return stokdarah
          .map((item) => item.golOneg)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
    default:
      return stokdarah
          .map((item) => item.golABneg)
          .reduce((accumulator, current) => accumulator + current)
          .toDouble();
      break;
  }
}

//format date
String formatDate(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date);
}
