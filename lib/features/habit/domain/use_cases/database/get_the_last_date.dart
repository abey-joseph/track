import 'package:injectable/injectable.dart';

@lazySingleton
class GetTheLastDate {
  bool isFirstTime = true;
  DateTime call() {
    if (isFirstTime) {
      isFirstTime = false;
      return DateTime(2025, 4, 12);
    } else {
      return DateTime(2025, 4, 13);
    }

    // just using a mock date to check for date difference
  }
}
