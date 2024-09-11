import 'package:flutter/material.dart';
import 'package:github_tracker/app/pages/home_page.dart';

import 'app/utils/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Tracker',
      theme: ThemeApp.theme,
      home: const HomePage(),
    );
  }
}
