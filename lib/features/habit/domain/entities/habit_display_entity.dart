import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';

part 'habit_display_entity.freezed.dart';

@freezed
class HabitDisplayEntity with _$HabitDisplayEntity {
  const factory HabitDisplayEntity({
    required HabitEntity habit,
    required List<HabitStatusEntity> statusList,
  }) = _HabitDisplayEntity;
}
