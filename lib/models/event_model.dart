part of 'models.dart';

class EventDonor extends Equatable {
  final String id;
  final String title;
  final String alamat;
  final String gambar;
  final String deskripsi;
  final String tanggalEvent;
  final String createdDate;

  EventDonor({
    @required this.id,
    @required this.title,
    @required this.alamat,
    @required this.gambar,
    @required this.deskripsi,
    @required this.tanggalEvent,
    @required this.createdDate,
  });

  factory EventDonor.fromJson(Map<String, dynamic> json) {
    return EventDonor(
      id: json['_id'],
      title: json['title'],
      alamat: json['alamat'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      tanggalEvent: json['tanggalEvent'],
      createdDate: json['createdDate'],
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        alamat,
        gambar,
        deskripsi,
        tanggalEvent,
        createdDate,
      ];
}

//
