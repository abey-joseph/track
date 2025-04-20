import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_status_entity.freezed.dart';

@freezed
class HabitStatusEntity with _$HabitStatusEntity {
  const factory HabitStatusEntity({
    int? statusId,
    required int habitId,
    required DateTime date,
    required dynamic value,
    String? note,
    DateTime? updatedAt,
  }) = _HabitStatusEntity;
}
