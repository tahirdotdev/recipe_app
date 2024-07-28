import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldfieldtextstyle() {
    return TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle lightfieldtextstyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16);
  }

  static TextStyle headingStyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  }

  static TextStyle recipeHead() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);
  }
}
