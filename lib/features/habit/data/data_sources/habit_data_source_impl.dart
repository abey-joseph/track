import 'package:injectable/injectable.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';

@LazySingleton(as: HabitDataSource)
class HabitDataSourceImpl implements HabitDataSource {}
