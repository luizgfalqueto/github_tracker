import 'package:github_tracker/app/models/repos.dart';
import 'package:github_tracker/app/models/user.dart';

abstract class UserService {
  Future<User?> findUser({required String user});
  Future<List<Repos>> getrepos({required String reposUrl});
}
