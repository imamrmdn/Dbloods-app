part of 'models.dart';

// final Random random = Random();
// final randomId = random.nextInt(250);

class Informasi {
  final int id;
  final String url, gambar, title, deskripsi, sumber, tanggal;

  Informasi({
    this.id,
    this.url,
    this.gambar,
    this.title,
    this.deskripsi,
    this.sumber,
    this.tanggal,
  });
}

//example model json
List<Informasi> informasi = [
  Informasi(
    id: 23456,
    url: 'https://kawalcovid19.id/',
    gambar:
        'https://pbs.twimg.com/profile_images/1234313294728482816/MxqOJd7F_400x400.jpg',
    title: 'Kawal informasi seputar COVID-19 secara tepat dan akurat.',
    deskripsi:
        'merupakan sumber informasi inisiatif sukarela warganet Indonesia pro-data, terdiri dari praktisi kesehatan, akademisi & profesional.',
    sumber: 'kawalcovid19.id',
    tanggal: '',
  ),
  Informasi(
    id: 53421,
    url: 'https://www.who.int/',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
  Informasi(
    id: 21346,
    url: '',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
  Informasi(
    id: 64512,
    url: '',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
  Informasi(
    id: 86612,
    url: '',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
  Informasi(
    id: 12352,
    url: '',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
  Informasi(
    id: 23476,
    url: '',
    gambar: '',
    title: 'judul2',
    deskripsi: '',
    sumber: '',
    tanggal: '',
  ),
];
