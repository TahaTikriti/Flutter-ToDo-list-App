import 'package:flutter/material.dart';
final ThemeData darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,

  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.0),
  ),


  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    shape: CircleBorder(), // Change to CircleBorder for a circular button
  ),



  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),

  iconTheme: IconThemeData(
    color: Colors.blue,
  ),
);

