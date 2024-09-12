import 'package:dio/dio.dart';
import 'package:github_tracker/app/models/repos.dart';
import 'package:github_tracker/app/models/user.dart';

import './user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final String _baseUrl = 'https://api.github.com';

  @override
  Future<User?> getUser(String user) async {
    final response = await Dio().get('$_baseUrl/users/$user');

    if (response.statusCode == 404) {
      return null;
    }

    return User.fromJson(response.data);
  }

  @override
  Future<List<Repos>?> getRepos(String user) async {
    final response = await Dio().get('$_baseUrl/users/$user/repos');

    if (response.statusCode == 404) {
      return null;
    }

    return response.data.map<Repos>((repo) => Repos.fromJson(repo)).toList();
  }
}
