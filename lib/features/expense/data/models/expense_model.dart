import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/expense_entity.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    int? id,
    required bool isExpense,
    required String title,
    required double amount,
    required String category,
    required String comment,
    required DateTime date,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}

ExpenseModel fromExpenseEntity(ExpenseEntity entity) {
  return ExpenseModel(
    id: entity.id,
    isExpense: entity.isExpense,
    title: entity.title,
    amount: entity.amount,
    category: entity.category,
    comment: entity.comment,
    date: entity.date,
  );
}

ExpenseEntity fromExpenseModel(ExpenseModel model) {
  return ExpenseEntity(
    id: model.id,
    title: model.title,
    isExpense: model.isExpense,
    category: model.category,
    amount: model.amount,
    comment: model.comment,
    date: model.date,
  );
}
