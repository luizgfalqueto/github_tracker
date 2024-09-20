import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_tracker/app/models/user.dart';
import 'package:github_tracker/app/services/user/user_service_impl.dart';

import '../../exceptions/exceptions.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(super.initialState) {
    on<UserFindEvent>(_findUser);
  }

  FutureOr<void> _findUser(UserFindEvent event, Emitter<UserState> emit) async {
    try {
      final user = await UserServiceImpl().findUser(user: event.userToSearch);

      if (user == null) {
        emit(UserInitialState());
      } else {
        emit(UserStateData(user: user));
      }
    } on NoUserFoundException catch (_) {
      emit(UserStateData());
    }
  }
}
