import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'stokdarah_event.dart';
part 'stokdarah_state.dart';

class StokdarahBloc extends Bloc<StokdarahEvent, StokdarahState> {
  StokdarahBloc() : super(StokdarahInitial());

  @override
  Stream<StokdarahState> mapEventToState(
    StokdarahEvent event,
  ) async* {
    if (event is FetchStokDarah) {
      List<StokDarah> stokDarah = await StokDarahService.getStokDarah();

      yield StokDarahLoaded(stokDarah: stokDarah);
    }
  }
}
