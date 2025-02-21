import 'package:flutter/material.dart';

Widget welcomeButton(VoidCallback onTap) {
  return SizedBox(
    height: 70,
    width: 70,
    child: FloatingActionButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      child: Icon(
        Icons.skip_next,
        size: 50,
      ),
    ),
  );
}
