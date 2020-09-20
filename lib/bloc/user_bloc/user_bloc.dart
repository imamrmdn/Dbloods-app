import 'dart:async';
import 'package:dbloods_app/models/models.dart';
import 'package:dbloods_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);

      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      User updatedUser = (state as UserLoaded).user.copyWith(
          nama: event.name,
          profilePicture: event.profileImage,
          golDarah: event.golDarah);
      //
      await UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    }
  }
}
