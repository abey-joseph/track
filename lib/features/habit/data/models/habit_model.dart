// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
class HabitModel with _$HabitModel {
  const factory HabitModel({
    int? habitId,
    required String habitName,
    required String description,
    @JsonKey(fromJson: intToBool, toJson: boolToInt) required bool isBinary,
    required String frequency,
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
