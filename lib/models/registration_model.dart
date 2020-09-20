part of 'models.dart';

class RegistrationData {
  String nama;
  String email;
  String golDarah;
  String jenkel;
  String pekerjaan;
  File profilePicture;
  String tanggalLahir;
  String tempatLahir;
  String password;

  RegistrationData({
    this.nama = ' ',
    this.email = '',
    this.golDarah,
    this.jenkel,
    this.pekerjaan,
    this.profilePicture,
    this.tanggalLahir,
    this.tempatLahir = ' ',
    this.password = '',
  });
}
