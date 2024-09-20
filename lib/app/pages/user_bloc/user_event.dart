part of 'user_bloc.dart';

abstract class UserEvent {}

class UserFindEvent extends UserEvent {
  final String userToSearch;

  UserFindEvent({required this.userToSearch});
}
