import 'package:flutter/material.dart';

import '../utils/theme_app.dart';

class ProfileItemDescription extends StatelessWidget {
  const ProfileItemDescription({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: ThemeApp.secondaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: ThemeApp.titleRegularStyle.copyWith(
              color: ThemeApp.secondaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}