// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitModelImpl _$$HabitModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitModelImpl(
      habitId: (json['habitId'] as num?)?.toInt(),
      habitName: json['habitName'] as String,
      description: json['description'] as String,
      isBinary: intToBool(json['isBinary']),
      frequency: json['frequency'] as String,
      countType: json['countType'] as String?,
      target: (json['target'] as num?)?.toDouble(),
      targetType: json['targetType'] as String?,
      selectedDays: stringToList(json['selectedDays']),
      inEveryXDays: (json['inEveryXDays'] as num?)?.toInt(),
      reminder: intToBool(json['reminder']),
      createdAt: stringToDate(json['createdAt']),
      updatedAt: stringToDate(json['updatedAt']),
    );

Map<String, dynamic> _$$HabitModelImplToJson(_$HabitModelImpl instance) =>
    <String, dynamic>{
      'habitId': instance.habitId,
      'habitName': instance.habitName,
      'description': instance.description,
      'isBinary': boolToInt(instance.isBinary),
      'frequency': instance.frequency,
      'countType': instance.countType,
      'target': instance.target,
      'targetType': instance.targetType,
      'selectedDays': listToString(instance.selectedDays),
      'inEveryXDays': instance.inEveryXDays,
      'reminder': boolToInt(instance.reminder),
      'createdAt': dateToString(instance.createdAt),
      'updatedAt': dateToString(instance.updatedAt),
    };
