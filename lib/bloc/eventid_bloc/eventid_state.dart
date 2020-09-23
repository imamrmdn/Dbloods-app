part of 'eventid_bloc.dart';

class EventidState extends Equatable {
  final List<EventId> eventId;

  const EventidState(this.eventId);

  @override
  List<Object> get props => [eventId];
}
