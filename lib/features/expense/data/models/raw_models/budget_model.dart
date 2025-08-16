import 'package:freezed_annotation/freezed_annotation.dart';
import 'json_converters.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

enum BudgetPeriodTypeModel { 
  @JsonValue('MONTH')
  month, 
  @JsonValue('WEEK')
  week, 
  @JsonValue('YEAR')
  year, 
  @JsonValue('CUSTOM')
  custom 
}

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    @JsonKey(name: 'budget_id') int? budgetId,
    required String uid,
    required String name,
    required String currency,
    @JsonKey(name: 'period_type') required BudgetPeriodTypeModel periodType,
    @JsonKey(name: 'start_on') required DateTime startOn,
    required double amount,
    @JsonKey(name: 'include_transfers') @BoolConverter() @Default(false) bool includeTransfers,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}
