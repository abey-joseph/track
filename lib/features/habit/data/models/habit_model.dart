// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
class HabitModel with _$HabitModel {
  const factory HabitModel({
    int? habitId,
    required String habitName,
    required String description,
    @JsonKey(fromJson: intToBool, toJson: boolToInt) required bool isBinary,
    required String frequencyType,
    String? countType,
    double? target,
    String? targetType,
    @JsonKey(fromJson: stringToList, toJson: listToString)
    List<bool>? selectedDays,
    int? inEveryXDays,
    @JsonKey(fromJson: intToBool, toJson: boolToInt) required bool reminder,
    @JsonKey(fromJson: stringToDate, toJson: dateToString)
    required DateTime createdAt,
    @JsonKey(fromJson: stringToDate, toJson: dateToString)
    required DateTime updatedAt,
  }) = _HabitModel;

  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);
}

bool intToBool(dynamic value) => value == 1;
int boolToInt(bool value) => value ? 1 : 0;

DateTime stringToDate(dynamic date) => DateTime.parse(date as String);
String dateToString(DateTime date) => date.toIso8601String();

List<bool> stringToList(dynamic text) {
  if (text == null || text is! String) return [];
  return text.split(',').map((e) => e == '1').toList();
}

String listToString(List<bool>? days) =>
    days?.map((e) => e ? '1' : '0').join(',') ?? '';

HabitModel fromEntityToModel(HabitEntity habitEntity) {
  return HabitModel(
      habitName: habitEntity.habitName,
      description: habitEntity.description,
      isBinary: habitEntity.isBinary,
      frequencyType: habitEntity.frequencyType,
      countType: habitEntity.countType,
      target: habitEntity.target,
      targetType: habitEntity.targetType,
      selectedDays: habitEntity.selectedDays,
      inEveryXDays: habitEntity.inEveryXDays,
      reminder: habitEntity.reminder,
      createdAt: habitEntity.createdAt,
      updatedAt: habitEntity.updatedAt);
}

HabitEntity fromModelToEntity(HabitModel habitModel) {
  return HabitEntity(
      habitId: habitModel.habitId,
      habitName: habitModel.habitName,
      description: habitModel.description,
      isBinary: habitModel.isBinary,
      frequencyType: habitModel.frequencyType,
      countType: habitModel.countType,
      target: habitModel.target,
      targetType: habitModel.targetType,
      selectedDays: habitModel.selectedDays,
      inEveryXDays: habitModel.inEveryXDays,
      reminder: habitModel.reminder,
      createdAt: habitModel.createdAt,
      updatedAt: habitModel.updatedAt);
}
