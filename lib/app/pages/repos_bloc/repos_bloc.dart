import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_tracker/app/exceptions/exceptions.dart';
import 'package:github_tracker/app/services/user/user_service_impl.dart';

import '../../models/repos.dart';

part 'repos_state.dart';
part 'repos_event.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  ReposBloc() : super(ReposInitialState()){
    on<GetReposEvent>(_getRepos);
  }

  FutureOr<void> _getRepos(GetReposEvent event, Emitter<ReposState> emit) async {
    try {
      final repos = await UserServiceImpl().getrepos(reposUrl: event.urlRepos);
      emit(ReposStateData(repos: repos));
    } on NoReposFoundException catch (_) {
      emit(ReposInitialState());
    }
  }
}
