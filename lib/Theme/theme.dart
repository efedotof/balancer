import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF263238);

final dartTheme = ThemeData(

  chipTheme: const ChipThemeData(
    selectedColor: Colors.blue,
    backgroundColor: Color(0xFF313C42)

  ),


  colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor, brightness: Brightness.dark),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF6A7276),
      )),
  primaryColor: Colors.black,
  hintColor: Colors.blueGrey,
  scaffoldBackgroundColor: const Color(0xFF1F1F1F),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFF333333),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1F1F1F),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
);

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor, brightness: Brightness.light),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color(0xFF5D5FF0),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF313036),
      )),
  primaryColor: Colors.white,
  hintColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
);
