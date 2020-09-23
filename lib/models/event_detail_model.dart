part of 'models.dart';

class EventDetail extends EventDonor {
  EventDetail(EventDonor eventDonor)
      : super(
          id: eventDonor.id,
          title: eventDonor.title,
          tanggalEvent: eventDonor.tanggalEvent,
          gambar: eventDonor.gambar,
          createdDate: eventDonor.createdDate,
          alamat: eventDonor.alamat,
          deskripsi: eventDonor.deskripsi,
        );

  @override
  List<Object> get props => super.props + [];
}
