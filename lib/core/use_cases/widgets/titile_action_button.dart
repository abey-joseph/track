import 'package:flutter/material.dart';

Widget titleActionButton({
  double size = 40,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return SizedBox(
    height: 50,
    width: 50,
    child: FloatingActionButton(
      elevation: 2,
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      child: Icon(
        icon,
        size: size,
      ),
    ),
  );
}
