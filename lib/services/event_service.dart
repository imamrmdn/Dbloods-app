part of 'services.dart';

class EventDonorService {
  static Future<List<EventDonor>> getEventDonor(
      {String id, http.Client client}) async {
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

  static Future<EventDetail> getEventDetail(EventDonor eventDonor,
      {String eventDonorId, http.Client client}) async {
    String url =
        'https://dbloods.herokuapp.com/api/event/${eventDonorId ?? eventDonor.id}';

    client ??= http.Client();
    var response = await client.get(url);
    var data = json.decode(response.body);
    var id = data['id'];

    return eventDonorId != null
        ? EventDetail(EventDonor.fromJson(data))
        : EventDetail(id);
  }
}
