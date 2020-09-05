import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Enter a City Name...',
  prefixIcon: Icon(Icons.search),
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.grey, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
  ),
);