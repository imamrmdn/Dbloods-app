part of 'models.dart';

class EventIdTransaction extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final DateTime time;
  final String picture;

  EventIdTransaction({
    @required this.userID,
    @required this.title,
    @required this.subtitle,
    @required this.time,
    this.picture,
  });

  @override
  List<Object> get props => [
        userID,
        title,
        subtitle,
        time,
        picture,
      ];
}
