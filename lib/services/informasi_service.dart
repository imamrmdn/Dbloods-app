part of 'services.dart';

class InformasiService {
  static Future<List<Informasi>> getInformasi({http.Client client}) async {
    String url = 'https://dbloods.herokuapp.com/api/informasi';

    client ??= http.Client();

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    //
    var dataInformasi = jsonDecode(response.body) as List;
    var listDataInformasi = dataInformasi.reversed;
    //print(listDataInformasi);
    return listDataInformasi.map((e) => Informasi.fromJson(e)).toList();
  }
}
