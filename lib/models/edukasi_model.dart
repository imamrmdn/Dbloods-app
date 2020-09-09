part of 'models.dart';

class Edukasi extends Equatable {
  final String id;
  final String title;
  final String penulis;
  final String gambar;
  final String deskripsi;
  final String createdAt;

  Edukasi({
    @required this.id,
    @required this.title,
    @required this.penulis,
    @required this.gambar,
    @required this.deskripsi,
    @required this.createdAt,
  });

  factory Edukasi.fromJson(Map<String, dynamic> data) {
    return Edukasi(
      id: data['_id'],
      title: data['title'],
      penulis: data['penulis'],
      gambar: data['gambar'],
      deskripsi: data['deskripsi'],
      createdAt: data['createdAt'],
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        penulis,
        gambar,
        deskripsi,
        createdAt,
      ];
}
