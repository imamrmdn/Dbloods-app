part of 'models.dart';

class Informasi extends Equatable {
  final String id;
  final String title;
  final String url;
  final String sumber;
  final String gambar;
  final String deskripsi;
  final String tanggalDibuat;

  Informasi({
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.sumber,
    @required this.gambar,
    @required this.deskripsi,
    @required this.tanggalDibuat,
  });

  factory Informasi.fromJson(Map<String, dynamic> data) {
    return Informasi(
      id: data['_id'],
      title: data['title'],
      url: data['url'],
      sumber: data['sumber'],
      gambar: data['gambar'],
      deskripsi: data['deskripsi'],
      tanggalDibuat: data['tanggalDibuat'],
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        url,
        sumber,
        gambar,
        deskripsi,
        tanggalDibuat,
      ];
}
