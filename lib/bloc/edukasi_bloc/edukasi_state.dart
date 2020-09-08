part of 'edukasi_bloc.dart';

abstract class EdukasiState extends Equatable {
  const EdukasiState();
}

class EdukasiInitial extends EdukasiState {
  @override
  List<Object> get props => [];
}

class EdukasiLoaded extends EdukasiState {
  final List<Edukasi> edukasi;

  EdukasiLoaded({this.edukasi});

  @override
  List<Object> get props => [edukasi];
}
