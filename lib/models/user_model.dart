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
  });

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
      ];
}
