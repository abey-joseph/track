// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringRuleModelImpl _$$RecurringRuleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecurringRuleModelImpl(
      ruleId: (json['rule_id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      templateJson: json['template_json'] as String,
      freq: $enumDecode(_$RecurringFrequencyModelEnumMap, json['freq']),
      interval: (json['interval'] as num?)?.toInt() ?? 1,
      byweekday: json['byweekday'] as String?,
      bymonthday: json['bymonthday'] as String?,
      nextRunOn: DateTime.parse(json['next_run_on'] as String),
      isPaused: json['is_paused'] == null
          ? false
          : const BoolConverter().fromJson(json['is_paused']),
    );

Map<String, dynamic> _$$RecurringRuleModelImplToJson(
        _$RecurringRuleModelImpl instance) =>
    <String, dynamic>{
      'rule_id': instance.ruleId,
      'uid': instance.uid,
      'template_json': instance.templateJson,
      'freq': _$RecurringFrequencyModelEnumMap[instance.freq]!,
      'interval': instance.interval,
      'byweekday': instance.byweekday,
      'bymonthday': instance.bymonthday,
      'next_run_on': instance.nextRunOn.toIso8601String(),
      'is_paused': const BoolConverter().toJson(instance.isPaused),
    };

const _$RecurringFrequencyModelEnumMap = {
  RecurringFrequencyModel.daily: 'DAILY',
  RecurringFrequencyModel.weekly: 'WEEKLY',
  RecurringFrequencyModel.monthly: 'MONTHLY',
  RecurringFrequencyModel.yearly: 'YEARLY',
  RecurringFrequencyModel.custom: 'CUSTOM',
};
