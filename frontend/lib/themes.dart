import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xfff5f5f5),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 233, 233, 233),
      actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
    ));

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color.fromARGB(255, 45, 31, 101),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 74, 74, 74)));
