import 'package:github_tracker/app/models/repos.dart';
import 'package:github_tracker/app/repositories/user/user_repository_impl.dart';

import '../../models/user.dart';
import './user_service.dart';

class UserServiceImpl extends UserService {
  @override
  Future<User?> findUser({required String user}) async {
    return await UserRepositoryImpl().getUser(user);
  }

  @override
  Future<List<Repos>> getrepos({required String reposUrl}) async {
    final reposList = await UserRepositoryImpl().getRepos(reposUrl);

    if (reposList == null) {
      return [];
    }

    return reposList;
  }

}