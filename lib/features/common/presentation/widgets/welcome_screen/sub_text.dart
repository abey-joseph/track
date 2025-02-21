import 'package:flutter/material.dart';

Widget welcomeSubText({required String text}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
  );
}
