part of 'extensions.dart';

// convert FirebaseUser to Object/Model User
extension FirebaseUserExtension on FirebaseUser {
  User convertToUser({
    String nama = 'Tidak ada Nama',
    String golDarah = 'Tidak Tahu',
    String tempatLahir = ' - ',
    String tanggalLahir = ' - ',
    String jenkel = ' - ',
    String pekerjaan = 'Mahasiswa',
  }) =>
      User(
        this.uid,
        this.email,
        nama: nama,
        golDarah: golDarah,
        tempatLahir: tempatLahir,
        tanggalLahir: tanggalLahir,
        jenkel: jenkel,
        pekerjaan: pekerjaan,
      );

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
