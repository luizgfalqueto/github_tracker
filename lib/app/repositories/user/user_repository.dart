import '../../models/repos.dart';
import '../../models/user.dart';

abstract class UserRepository {
  Future<User?> getUser(String user);
  Future<List<Repos>?> getRepos(String user);
}