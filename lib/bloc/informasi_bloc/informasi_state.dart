part of 'informasi_bloc.dart';

abstract class InformasiState extends Equatable {
  const InformasiState();
}

class InformasiInitial extends InformasiState {
  @override
  List<Object> get props => [];
}

class InformasiLoaded extends InformasiState {
  final List<Informasi> informasi;

  InformasiLoaded({this.informasi});

  @override
  List<Object> get props => [informasi];
}
