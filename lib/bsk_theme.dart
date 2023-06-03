import 'package:flutter/material.dart';

class BskTheme {
  static TextTheme lightTextTheme = const TextTheme(
    titleMedium: TextStyle(
      fontSize: 15.0,
      color: Colors.black54,
      fontWeight: FontWeight.w800,
    ),
  );

  static TextStyle heading1 = const TextStyle(
    fontSize: 17.0,
    color: Colors.black54,
    fontWeight: FontWeight.w800,
  );

  static TextStyle abbriviationText = const TextStyle(
    fontSize: 30.0,
    color: Colors.black87,
    fontWeight: FontWeight.w900,
  );

  static ButtonStyle btnStyle = ButtonStyle(
    textStyle: const MaterialStatePropertyAll(
      TextStyle(
        fontSize: 20.0,
        height: 0.7,
      ),
    ),
    foregroundColor: const MaterialStatePropertyAll(Colors.black),
    backgroundColor: const MaterialStatePropertyAll(Colors.white),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
  static Color bgColorDark = const Color.fromRGBO(65, 65, 93, 100);
  static Color bgColorLight = const Color.fromRGBO(65, 65, 93, 0);
  static Color navBarIconLight = Colors.white;

  static ThemeData bodyDark() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          foregroundColor: Color.fromRGBO(65, 65, 93, 100),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          )),
      primarySwatch: Colors.blueGrey,
    );
  }

  static ThemeData bodyLight() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          foregroundColor: Color.fromRGBO(65, 65, 93, 0),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          )),
      textTheme: lightTextTheme,
      primarySwatch: Colors.blueGrey,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.normal,
      ),
    );
  }
}
