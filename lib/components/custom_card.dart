import 'package:flutter/material.dart';

Widget customCard(Widget child) {
  return Card(
    elevation: 8.0,
    color: const Color.fromARGB(72, 88, 88, 88),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFF3AE3D))),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: child,
  );
}
