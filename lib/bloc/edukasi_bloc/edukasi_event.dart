part of 'edukasi_bloc.dart';

abstract class EdukasiEvent extends Equatable {
  const EdukasiEvent();
}

class FetchEdukasi extends EdukasiEvent {
  @override
  List<Object> get props => [];
}
