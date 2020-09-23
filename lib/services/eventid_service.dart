part of 'services.dart';

class EventIdServices {
  static CollectionReference eventIdCollection =
      Firestore.instance.collection('eventid');

  static Future<void> saveEventId(String id, EventId eventId) async {
    await eventIdCollection.document().setData({
      'eventID': eventId.eventDonor.id ?? '',
      'userID': id ?? '',
      'donorID': eventId.donorId ?? '',
      'jamEvent': eventId.jamEvent ?? '',
      'nama': eventId.nama ?? '',
      'jenkel': eventId.jenkel ?? '',
      'pekerjaan': eventId.pekerjaan ?? '',
      'time': eventId.time.microsecondsSinceEpoch ??
          DateTime.now().microsecondsSinceEpoch,
    });
  }

  static Future<List<EventId>> getEventId(String userID) async {
    QuerySnapshot snapshot = await eventIdCollection.getDocuments();
    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    List<EventId> eventId = [];
    for (var document in documents) {
      EventDetail eventDetail = await EventDonorService.getEventDetail(null,
          eventDonorId: document.data['eventID']);

      // EventDonorState eventState =

      eventId.add(
        EventId(
          document.data['eventID'],
          document.data['donorID'],
          document.data['jamEvent'],
          document.data['nama'],
          document.data['jenkel'],
          document.data['pekerjaan'],
          DateTime.fromMicrosecondsSinceEpoch(document.data['time']),
        ),
      );
    }

    return eventId;
  }
}
