import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_status_entity.freezed.dart';

@freezed
class HabitStatusEntity with _$HabitStatusEntity {
  const factory HabitStatusEntity({
    required int id,
    required DateTime date,
    required dynamic status,
  }) = _HabitStatusEntity;
}
