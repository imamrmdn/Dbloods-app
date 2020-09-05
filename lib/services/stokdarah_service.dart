part of 'services.dart';

class StokDarahService {
  static Future<List<StokDarah>> getStokDarah({http.Client client}) async {
    String url = 'https://dbloods.herokuapp.com/api/stokdarah';
    //
    client ??= http.Client();
    //
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    //
    var data = json.decode(response.body) as List;
    var listdata = data.reversed;
    //print(listdata);
    return listdata.map((e) => StokDarah.fromJson(e)).toList();
  }
}
