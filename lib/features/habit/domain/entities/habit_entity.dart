import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entity.freezed.dart';

@freezed
class HabitEntity with _$HabitEntity {
  const factory HabitEntity({
    int? id,
    required String habitName,
    required String description,
    required bool isBinary,
    required String frquency,
    String? countType,
    double? target,
    String? targetType,
    List<bool>? selectedDays,
    int? inEveryXDays,
  }) = _HabitEntity;
}
