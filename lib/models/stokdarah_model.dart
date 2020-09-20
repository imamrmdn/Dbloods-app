part of 'models.dart';

//
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

//todo: model stok darah
class StokDarah extends Equatable {
  final String id;
  final String namars;
  final String alamatrs;
  final String notelp;
  final int golApos;
  final int golBpos;
  final int golOpos;
  final int golABpos;
  final int golAneg;
  final int golBneg;
  final int golOneg;
  final int golABneg;
  final String updatedAt;
  final String createdDate;

  StokDarah({
    @required this.id,
    @required this.namars,
    @required this.alamatrs,
    @required this.notelp,
    @required this.golApos,
    @required this.golBpos,
    @required this.golOpos,
    @required this.golABpos,
    @required this.golAneg,
    @required this.golBneg,
    @required this.golOneg,
    @required this.golABneg,
    @required this.updatedAt,
    @required this.createdDate,
  });

  //
  factory StokDarah.fromJson(Map<String, dynamic> json) {
    return StokDarah(
      id: json['_id'],
      namars: json['nama_rs'],
      alamatrs: json['alamat_rs'],
      notelp: json['no_telp'],
      golApos: json['gol_Apos'],
      golBpos: json['gol_Bpos'],
      golOpos: json['gol_Opos'],
      golABpos: json['gol_ABpos'],
      golAneg: json['gol_Aneg'],
      golBneg: json['gol_Bneg'],
      golOneg: json['gol_Oneg'],
      golABneg: json['gol_ABneg'],
      updatedAt: json['updatedAt'],
      createdDate: json['createdDate'],
    );
  }

  // List<StokDarah> get jumlahGolonganDarahApos {
  //   return ;
  // }

  @override
  List<Object> get props => [
        id,
        namars,
        alamatrs,
        notelp,
        golApos,
        golBpos,
        golOpos,
        golABpos,
        golAneg,
        golBneg,
        golOneg,
        golABneg,
        updatedAt,
        createdDate,
      ];
}
