part of 'models.dart';

class EventId extends Equatable {
  final EventDonor eventDonor;
  final String donorId;
  final String jamEvent;
  final String nama;
  final String jenkel;
  final String pekerjaan;
  final DateTime time;

  EventId(
    this.eventDonor,
    this.donorId,
    this.jamEvent,
    this.nama,
    this.jenkel,
    this.pekerjaan,
    this.time,
  );

  @override
  List<Object> get props => [
        eventDonor,
        donorId,
        jamEvent,
        nama,
        jenkel,
        pekerjaan,
        time,
      ];
}
