import 'package:flutter/material.dart';
import 'package:rainbowapp/pages/chooselocation.dart';
import 'package:rainbowapp/pages/default_location.dart';
import 'package:rainbowapp/pages/home.dart';
import 'package:rainbowapp/pages/loading.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => loading(),
      '/home': (context) => home(),
      '/choose_location': (context) => choose_location(),


    },
  ));
}

