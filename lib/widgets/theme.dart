import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.amber,
        primary: Colors.purple,
      ),
      fontFamily: 'Quicksand',
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
      appBarTheme: AppBarTheme(
        toolbarTextStyle: ThemeData.light()
            .textTheme
            .copyWith(
              titleLarge: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
            .bodyMedium,
        titleTextStyle: ThemeData.light()
            .textTheme
            .copyWith(
              titleLarge: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
            .titleLarge,
      ),
    );
  }
}
