abstract class Exceptions implements Exception {}

class NoReposFoundException extends Exceptions {}

class NoUserFoundException implements Exceptions {
  final String? message;

  NoUserFoundException() : message = 'Nenhum usuário encontrado';
}
