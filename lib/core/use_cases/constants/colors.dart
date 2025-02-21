import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProjectColors {
  static bool isLightTheme = true;

  // Colors those are fixed

  //Colors those need change based on theme
  static Color navBarBgColorLight = ThemeData.light().scaffoldBackgroundColor;

  Future<bool> changeToLight() async {
    try {
      navBarBgColorLight = ThemeData.light().scaffoldBackgroundColor;
      return true;
    } catch (e) {
      log("Error while trying to change colors from dark to light, reason - ${e.toString()}");
      return false;
    }
  }

  Future<bool> changeToDark() async {
    try {
      navBarBgColorLight = ThemeData.dark().scaffoldBackgroundColor;
      return true;
    } catch (e) {
      log("Error while trying to change colors from light to dark, reason - ${e.toString()}");
      return false;
    }
  }
}
