import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'edukasi_event.dart';
part 'edukasi_state.dart';

class EdukasiBloc extends Bloc<EdukasiEvent, EdukasiState> {
  EdukasiBloc() : super(EdukasiInitial());

  @override
  Stream<EdukasiState> mapEventToState(
    EdukasiEvent event,
  ) async* {
    if (event is FetchEdukasi) {
      List<Edukasi> edukasi = await EdukasiService.getEdukasi();

      yield EdukasiLoaded(edukasi: edukasi);
    }
  }
}
