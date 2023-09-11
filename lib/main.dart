import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/main_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
    ) ,
    home: MainScreen(),
    // initialRoute: '/',
    routes: {
      // '/': (context) => MainScreen(),
      '/todo': (context) => Home(),
    },
  ));
}

