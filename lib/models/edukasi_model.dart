part of 'models.dart';

class Edukasi {
  final int id;
  final String gambar, title, sumber, tanggal, penulis;

  Edukasi({
    this.id,
    this.gambar = '',
    this.title,
    this.sumber = '',
    this.tanggal,
    this.penulis,
  });
}
