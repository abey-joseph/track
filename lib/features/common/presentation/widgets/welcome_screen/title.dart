import 'package:flutter/material.dart';

Widget welcomeTitle({required String title}) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 25,
    ),
  );
}
