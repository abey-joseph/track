import 'package:freezed_annotation/freezed_annotation.dart';
import 'json_converters.dart';

part 'recurring_rule_model.freezed.dart';
part 'recurring_rule_model.g.dart';

enum RecurringFrequencyModel { 
  @JsonValue('DAILY')
  daily, 
  @JsonValue('WEEKLY')
  weekly, 
  @JsonValue('MONTHLY')
  monthly, 
  @JsonValue('YEARLY')
  yearly, 
  @JsonValue('CUSTOM')
  custom 
}

@freezed
class RecurringRuleModel with _$RecurringRuleModel {
  const factory RecurringRuleModel({
    @JsonKey(name: 'rule_id') int? ruleId,
    required String uid,
    @JsonKey(name: 'template_json') required String templateJson,
    required RecurringFrequencyModel freq,
    @Default(1) int interval,
    String? byweekday,
    String? bymonthday,
    @JsonKey(name: 'next_run_on') required DateTime nextRunOn,
    @JsonKey(name: 'is_paused') @BoolConverter() @Default(false) bool isPaused,
  }) = _RecurringRuleModel;

  factory RecurringRuleModel.fromJson(Map<String, dynamic> json) =>
      _$RecurringRuleModelFromJson(json);
}
