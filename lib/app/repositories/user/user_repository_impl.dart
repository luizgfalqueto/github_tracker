import 'dart:async';

import 'package:dio/dio.dart';
import 'package:github_tracker/app/models/repos.dart';

import '../../exceptions/exceptions.dart';
import '../../models/user.dart';
import './user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final String _baseUrl = 'https://api.github.com';

  @override
  Future<User?> getUser(String user) async {
    try {
      final response = await Dio().get('$_baseUrl/users/$user');

      return User.fromJson(response.data);
    } on DioException catch (_) {
      throw NoUserFoundException();
    }
  }

  @override
  Future<List<Repos>?> getRepos(String user) async {
    try {
      final response = await Dio().get('$_baseUrl/users/$user/repos');

      if (response.statusCode == 404) {
        return null;
      }

      return response.data.map<Repos>((repo) => Repos.fromJson(repo)).toList();
    } on DioException catch (_) {
      throw NoReposFoundException();
    }
  }
}
