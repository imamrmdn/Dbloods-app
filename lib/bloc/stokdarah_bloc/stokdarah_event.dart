part of 'stokdarah_bloc.dart';

abstract class StokdarahEvent extends Equatable {
  const StokdarahEvent();
}

class FetchStokDarah extends StokdarahEvent {
  @override
  List<Object> get props => [];
}
