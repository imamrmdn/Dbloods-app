part of 'models.dart';

class User extends Equatable {
  final String id;
  final String nama;
  final String profilePicture;
  final String email;
  final String golDarah;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenkel;
  final String pekerjaan;
  //final String password;

  User(
    this.id,
    this.email, {
    this.nama,
    this.profilePicture,
    this.golDarah,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenkel,
    this.pekerjaan,
    //this.password,
  });

  @override
  String toString() {
    return '$id - $nama - $email - $golDarah - $pekerjaan';
  }

  @override
  List<Object> get props => [
        id,
        email,
        nama,
        profilePicture,
        golDarah,
        tempatLahir,
        tanggalLahir,
        jenkel,
        pekerjaan,
        //password,
      ];
}
