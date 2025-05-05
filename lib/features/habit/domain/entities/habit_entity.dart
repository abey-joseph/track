import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entity.freezed.dart';

@freezed
class HabitEntity with _$HabitEntity {
  const factory HabitEntity({
    int? habitId,
    required String habitName,
    required String description,
    required bool isBinary,
    required String? frequencyType,
    String? countType,
    String? target,
    String? targetType,
    List<bool>? selectedDays,
    String? inEveryXDays,
    required bool reminder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HabitEntity;
}
