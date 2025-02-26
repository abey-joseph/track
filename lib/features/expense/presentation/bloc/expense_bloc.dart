import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_event.dart';
part 'expense_state.dart';
part 'expense_bloc.freezed.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(expenseInitial()) {
    on<fetchExpense>(_handleFetchExpense);
    on<addExpense>(_handleAddExpense);
    on<editExpense>(_handleEditExpense);
    on<deleteExpense>(_handleDeleteExpense);
  }

  FutureOr<void> _handleDeleteExpense(event, emit) {}

  FutureOr<void> _handleEditExpense(event, emit) {}

  FutureOr<void> _handleAddExpense(event, emit) {}

  FutureOr<void> _handleFetchExpense(event, emit) {}
}
