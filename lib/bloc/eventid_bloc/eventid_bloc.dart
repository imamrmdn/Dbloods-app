import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'eventid_event.dart';
part 'eventid_state.dart';

class EventidBloc extends Bloc<EventidEvent, EventidState> {
  EventidBloc() : super(EventidState([]));

  @override
  Stream<EventidState> mapEventToState(
    EventidEvent event,
  ) async* {
    if (event is FollowEvent) {
      await EventIdServices.saveEventId(event.userID, event.eventId);

      List<EventId> eventId = state.eventId + [event.eventId];

      yield EventidState(eventId);
    } else if (event is GetEventId) {
      List<EventId> eventId = await EventIdServices.getEventId(event.userID);

      yield EventidState(eventId);
    }
  }
}
