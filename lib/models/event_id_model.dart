part of 'models.dart';

class EventId extends Equatable {
  final EventDonor eventDonor;
  final String donorId;
  final String jamEvent;
  final String nama;
  final String jenkel;
  final String pekerjaan;

  EventId(
    this.eventDonor,
    this.donorId,
    this.jamEvent,
    this.nama,
    this.jenkel,
    this.pekerjaan,
  );

  @override
  List<Object> get props => [
        eventDonor,
        donorId,
        jamEvent,
        nama,
        jenkel,
        pekerjaan,
      ];
}
