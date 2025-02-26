part of 'expense_bloc.dart';

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState.expenseInitial() = expenseInitial;
  const factory ExpenseState.expenseFetched() = expenseFetched;
  const factory ExpenseState.expenseAdded() = expenseAdded;
  const factory ExpenseState.expenseDeleted() = expenseDeleted;
  const factory ExpenseState.expenseEdited() = expenseEdited;
}
