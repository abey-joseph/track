import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:track/features/common/data/data_sources/shared_prefs_common.dart';
import 'package:track/features/common/domain/repo/app_preferences_repo.dart';

@LazySingleton(as: AppPreferencesRepo)
class AppPreferencesRepoImpl implements AppPreferencesRepo {
  @override
  Future<bool> isFirstTimeLauch() async {
    try {
      bool? isFirstTime = SharedPrefsCommon.sp.getBool('isFirstTime');
      if (isFirstTime == true || isFirstTime == null) {
        await SharedPrefsCommon.sp.setBool('isFirstTime', false);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("error while checking isFirstTime launch in Shared preferences");
      return false;
    }
  }
}
