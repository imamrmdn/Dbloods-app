part of 'eventdonor_bloc.dart';

abstract class EventdonorState extends Equatable {
  const EventdonorState();
}

class EventdonorInitial extends EventdonorState {
  @override
  List<Object> get props => [];
}

class EventDonorLoaded extends EventdonorState {
  final List<EventDonor> eventDonor;

  EventDonorLoaded({this.eventDonor});

  @override
  List<Object> get props => [
        eventDonor,
      ];
}
