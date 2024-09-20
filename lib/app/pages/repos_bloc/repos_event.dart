part of 'repos_bloc.dart';

class ReposEvent {}

class GetReposEvent extends ReposEvent {
  final String urlRepos;

  GetReposEvent({required this.urlRepos});
}
