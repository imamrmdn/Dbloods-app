part of 'services.dart';

class EdukasiService {
  //
  static Future<List<Edukasi>> getEdukasi({http.Client client}) async {
    String url = 'https://dbloods.herokuapp.com/api/edukasi';

    client ??= http.Client();

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    //
    var dataEdukasi = jsonDecode(response.body) as List;
    var listDataEdukasi = dataEdukasi.reversed;

    //print(listDataEdukasi);
    return listDataEdukasi.map((e) => Edukasi.fromJson(e)).toList();
  }
}
