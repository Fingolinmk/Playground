import 'package:flutter/material.dart';

class Typo {
  static TextStyle H1() {
    return TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  }

  static TextStyle description() {
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(167, 65, 73, 82));
  }
}
