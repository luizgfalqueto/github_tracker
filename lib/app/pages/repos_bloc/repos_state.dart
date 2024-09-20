part of 'repos_bloc.dart';

abstract class ReposState {}

class ReposInitialState extends ReposState {}

class ReposStateData extends ReposState {
  final List<Repos> repos;

  ReposStateData({required this.repos});
}
