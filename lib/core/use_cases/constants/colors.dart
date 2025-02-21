import 'dart:developer';

class ProjectColors {
  static bool isLightTheme = true;

  // Colors those are fixed

  //Colors those need change based on theme

  Future<bool> changeToLight() async {
    try {
      isLightTheme = true;
      return true;
    } catch (e) {
      log("Error while trying to change colors from dark to light, reason - ${e.toString()}");
      return false;
    }
  }

  Future<bool> changeToDark() async {
    try {
      isLightTheme = false;
      return true;
    } catch (e) {
      log("Error while trying to change colors from light to dark, reason - ${e.toString()}");
      return false;
    }
  }
}
