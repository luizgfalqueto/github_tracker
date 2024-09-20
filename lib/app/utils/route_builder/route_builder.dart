import 'package:flutter/material.dart';
import 'package:github_tracker/app/pages/home_page.dart';
import 'package:github_tracker/app/pages/repos_page.dart';
import 'package:github_tracker/app/pages/user_page.dart';

class RouteBuilder {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case UserPage.routeName:
        // Verifica e pega os argumentos enviados para a rota
        final arguments = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => UserPage(user: arguments),
          settings: settings,
        );
      case ReposPage.routeName:
        final arguments = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ReposPage(urlRepos: arguments,),
          settings: settings,
        );
      default:
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }
}
