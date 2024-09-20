import 'package:flutter/material.dart';

import '../utils/theme_app.dart';

class EmptyUserPage extends StatelessWidget {
  const EmptyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ThemeApp.secondaryColor,
          ),
        ),
        backgroundColor: ThemeApp.primaryColor,
      ),
      backgroundColor: ThemeApp.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_found_image.png',
              width: MediaQuery.of(context).size.width * .6,
            ),
            Text(
              'No user found!',
              style: ThemeApp.titleLargeStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Text('Search another user'),
            )
          ],
        ),
      ),
    );
  }
}
