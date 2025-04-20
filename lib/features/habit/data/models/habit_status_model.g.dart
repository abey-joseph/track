// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitStatusModelImpl _$$HabitStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HabitStatusModelImpl(
      statusId: (json['statusId'] as num?)?.toInt(),
      habitId: (json['habitId'] as num).toInt(),
      date: parseDateTime(json['date']),
      value: json['value'],
      note: json['note'] as String?,
      updatedAt: parseDateTimeNullable(json['updatedAt']),
    );

Map<String, dynamic> _$$HabitStatusModelImplToJson(
        _$HabitStatusModelImpl instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'habitId': instance.habitId,
      'date': toIso(instance.date),
      'value': instance.value,
      'note': instance.note,
      'updatedAt': toIsoNullable(instance.updatedAt),
    };
