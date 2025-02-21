import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefsCommon {
  static late SharedPreferences sp;

  Future<bool> intilialize() async {
    try {
      sp = await SharedPreferences.getInstance();
      log("Shared prefernce initialized");
      return true;
    } catch (e) {
      log("Shared prefernce initialize failed, reason - ${e.toString()}");
      return false;
    }
  }
}
