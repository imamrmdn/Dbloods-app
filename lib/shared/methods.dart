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

//todo: calculate golongan darah
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

//format date 2
String formatDate2(String date) {
  return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
}

//cek stok darah
cekStokDarah(int golDarah) {
  String nol = 'tidak tersedia';
  String stok = '$golDarah Stok';
  if (golDarah == 0) {
    return nol;
  } else {
    return stok;
  }
}

//Belum ada Data
noDataYet(String menu) {
  return ListView(
    children: <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/no_data.png',
              height: SizeConfig.defaultWidth / 2,
            ),
            Text('Belum Ada Data $menu', style: blackTextFont),
          ],
        ),
      ),
    ],
  );
}

//cachedNetworkImage
cachedNetworkImage(String gambar, TickerProvider vsync) {
  if (gambar != '') {
    return CachedNetworkImage(
      imageUrl: gambar,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SpinKitPulse(
              color: Colors.red[300],
              controller: AnimationController(
                  vsync: vsync,
                  value: downloadProgress.progress,
                  duration: const Duration(milliseconds: 1200))),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
          borderRadius: borderRadius8,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  } else {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: borderRadius8,
/************* */ image: DecorationImage(
          image: AssetImage('assets/gallery_icon.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//cek data event
handleOnTapEvent(String date, BuildContext context, EventDonor eventDonor) {
  DateTime dateNows = DateTime.now();
  final dateFormat = formatDate2(date);
  final dateNowFormat = formatDate(dateNows);
  final dateEventDay = int.parse(dateFormat.split('-').first);
  final timeEvent = dateEventDay - dateNows.day;
  //
  if (dateFormat != dateNowFormat) {
    if (dateNows.isAfter(DateTime.parse(date))) {
      return showDialog(
        context: context,
        builder: (_) => AlertDialogAnimation(
          image: Image.asset(
            'assets/notify_email.png',
            width: 250,
            height: 130,
          ),
          message:
              'Maaf Tidak Bisa Mengikuti Event Donor ini Karena Tanggal Event Sudah Lewat.',
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (_) => AlertDialogAnimation(
          image: Image.asset(
            'assets/waiting.png',
            width: 250,
            height: 130,
          ),
          message:
              'Tunggu ya Waktu Event tinggal $timeEvent hari lagi, baru kamu bisa mengikutinya',
        ),
      );
    }
  } else {
    print('berhasil mengikuti event');
    context.bloc<ScreenBloc>().add(GoToEventDetailScreen(eventDonor));
  }
}
