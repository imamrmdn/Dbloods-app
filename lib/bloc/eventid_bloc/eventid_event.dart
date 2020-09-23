part of 'eventid_bloc.dart';

abstract class EventidEvent extends Equatable {
  const EventidEvent();
}

class GetEventId extends EventidEvent {
  final String userID;

  GetEventId(this.userID);

  @override
  List<Object> get props => [userID];
}

//follow event == buy event
class FollowEvent extends EventidEvent {
  final EventId eventId;
  final String userID;

  FollowEvent(this.eventId, this.userID);

  @override
  List<Object> get props => [eventId, userID];
}
