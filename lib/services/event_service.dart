part of 'services.dart';

class EventDonorService {
  static Future<List<EventDonor>> getEventDonor({http.Client client}) async {
    String url = 'https://dbloods.herokuapp.com/api/event';
    //
    client ??= http.Client();
    //
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    //
    var data = json.decode(response.body) as List;
    var listDataEvent = data.reversed;

    return listDataEvent.map((e) => EventDonor.fromJson(e)).toList();
  }
}
