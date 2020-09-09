import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'eventdonor_event.dart';
part 'eventdonor_state.dart';

class EventdonorBloc extends Bloc<EventdonorEvent, EventdonorState> {
  EventdonorBloc() : super(EventdonorInitial());

  @override
  Stream<EventdonorState> mapEventToState(
    EventdonorEvent event,
  ) async* {
    if (event is FetchEventDonor) {
      List<EventDonor> eventDonor = await EventDonorService.getEventDonor();

      yield EventDonorLoaded(eventDonor: eventDonor);
    }
  }
}
