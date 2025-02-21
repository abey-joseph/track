import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/domain/repo/app_preferences_repo.dart';

@lazySingleton
class CheckFirstTime {
  final AppPreferencesRepo repo = getIt<AppPreferencesRepo>();

  Future<bool> isFirstTimeLauch() async {
    return await repo.isFirstTimeLauch();
  }
}
