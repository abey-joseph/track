import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_transactions.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactions _getTransactions;

  TransactionsBloc(this._getTransactions) : super(const TransactionsState.initial()) {
    on<_TransactionsLoad>(_onLoad);
    on<_TransactionsAdd>(_onAdd);
    on<_TransactionsUpdate>(_onUpdate);
  }

  Future<void> _onLoad(_TransactionsLoad event, Emitter<TransactionsState> emit) async {
    emit(const TransactionsState.loading());
    
    final result = await _getTransactions.call(
      uid: event.uid,
      from: event.from,
      to: event.to,
    );
    
    result.fold(
      (failure) {
        emit(TransactionsState.failure(failure.message));
        print('Transactions load failed: ${failure.message}, Code: ${failure.code}');
        if (failure.cause != null) {
          print('Cause: ${failure.cause}');
        }
      },
      (transactions) {
        emit(TransactionsState.loaded(transactions));
      },
    );
  }

  Future<void> _onAdd(_TransactionsAdd event, Emitter<TransactionsState> emit) async {
    try {
      // For now, just reload transactions
      // In the future, you might want to add the transaction to the repository
      final currentState = state;
      if (currentState is _TransactionsLoaded) {
        final updatedTransactions = [...currentState.transactions, event.transaction];
        emit(TransactionsState.loaded(updatedTransactions));
      }
    } catch (e) {
      emit(TransactionsState.failure(e.toString()));
    }
  }

  Future<void> _onUpdate(_TransactionsUpdate event, Emitter<TransactionsState> emit) async {
    try {
      // For now, just reload transactions
      // In the future, you might want to update the transaction in the repository
      final currentState = state;
      if (currentState is _TransactionsLoaded) {
        final updatedTransactions = currentState.transactions.map((t) {
          if (t.transactionId == event.transaction.transactionId) {
            return event.transaction;
          }
          return t;
        }).toList();
        emit(TransactionsState.loaded(updatedTransactions));
      }
    } catch (e) {
      emit(TransactionsState.failure(e.toString()));
    }
  }
}


