part of 'services.dart';

class EventIdTransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      EventIdTransaction cinematixTransaction) async {
    await transactionCollection.document().setData({
      'userID': cinematixTransaction.userID,
      'title': cinematixTransaction.title,
      'subtitle': cinematixTransaction.subtitle,
      'time': cinematixTransaction.time.millisecondsSinceEpoch,
      'picture': cinematixTransaction.picture,
    });
  }

  static Future<Null> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.getDocuments();

    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    return documents
        .map((e) => EventIdTransaction(
              userID: e.data['userID'],
              title: e.data['title'],
              subtitle: e.data['subtitle'],
              time: DateTime.fromMicrosecondsSinceEpoch(e.data['time']),
              picture: e.data['picture'],
            ))
        .toList();
  }
}
