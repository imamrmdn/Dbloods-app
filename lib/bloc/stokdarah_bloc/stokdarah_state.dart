part of 'stokdarah_bloc.dart';

abstract class StokdarahState extends Equatable {
  const StokdarahState();
}

class StokdarahInitial extends StokdarahState {
  @override
  List<Object> get props => [];
}

class StokDarahLoaded extends StokdarahState {
  final List<StokDarah> stokDarah;

  StokDarahLoaded({this.stokDarah});

  @override
  List<Object> get props => [stokDarah];
}
