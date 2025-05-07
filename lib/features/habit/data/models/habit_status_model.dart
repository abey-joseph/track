// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';

part 'habit_status_model.freezed.dart';
part 'habit_status_model.g.dart';

@freezed
class HabitStatusModel with _$HabitStatusModel {
  const factory HabitStatusModel({
    int? statusId,
    required int habitId,
    @JsonKey(fromJson: parseDateTime, toJson: toIso) required DateTime date,
    @JsonKey(fromJson: jsonDecode, toJson: jsonEncode)
    dynamic value, // could be bool, int, double, etc.

    String? note,
    @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
    DateTime? updatedAt,
  }) = _HabitStatusModel;

  factory HabitStatusModel.fromJson(Map<String, dynamic> json) =>
      _$HabitStatusModelFromJson(json);
}

DateTime parseDateTime(dynamic date) => DateTime.parse(date as String);
DateTime? parseDateTimeNullable(dynamic date) =>
    date != null ? DateTime.parse(date as String) : null;

String toIso(DateTime date) => date.toIso8601String();
String? toIsoNullable(DateTime? date) => date?.toIso8601String();

HabitStatusEntity fromStatusModelToEntity(HabitStatusModel habitStatusModel) {
  throw UnimplementedError();
}

HabitStatusModel fromStatusEntityToModel(HabitStatusEntity habitStatusEntity) {
  throw UnimplementedError();
}
