import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp._();

  static const primaryColor = Color(0xFF141b23);
  static const secondaryColor = Color(0xFFd0d7e1);

  static TextStyle titleRegularStyle = const TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  );

  static final inputDecoration = InputDecoration(
    filled: false,
    fillColor: Colors.white,
    floatingLabelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: ThemeApp.defaultInputBorder,
    focusedBorder: ThemeApp.defaultInputBorder,
    errorBorder: ThemeApp.defaultInputBorder.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    border: ThemeApp.defaultInputBorder,
  );

  static get theme => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
            backgroundColor: secondaryColor,
            foregroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red.shade400,
          ),
        ),
      );
}
