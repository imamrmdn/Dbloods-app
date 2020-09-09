part of 'eventdonor_bloc.dart';

abstract class EventdonorEvent extends Equatable {
  const EventdonorEvent();
}

class FetchEventDonor extends EventdonorEvent {
  @override
  List<Object> get props => [];
}
