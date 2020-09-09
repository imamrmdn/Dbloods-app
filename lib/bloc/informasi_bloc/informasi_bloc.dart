import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'informasi_event.dart';
part 'informasi_state.dart';

class InformasiBloc extends Bloc<InformasiEvent, InformasiState> {
  InformasiBloc() : super(InformasiInitial());

  @override
  Stream<InformasiState> mapEventToState(
    InformasiEvent event,
  ) async* {
    if (event is FetchInformasi) {
      List<Informasi> informasi = await InformasiService.getInformasi();

      yield InformasiLoaded(informasi: informasi);
    }
  }
}
