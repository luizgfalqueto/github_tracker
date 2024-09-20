part of 'user_bloc.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserNotFoundState extends UserState {}

class UserStateData extends UserState {
  final User? user;

  UserStateData({this.user});
}
