part of 'expense_bloc.dart';

@freezed
class ExpenseEvent with _$ExpenseEvent {
  const factory ExpenseEvent.fetchExpense() = fetchExpense;
  const factory ExpenseEvent.addExpense() = addExpense;
  const factory ExpenseEvent.editExpense() = editExpense;
  const factory ExpenseEvent.deleteExpense() = deleteExpense;
}
