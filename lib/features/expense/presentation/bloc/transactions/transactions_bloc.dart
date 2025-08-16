import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_transactions.dart';
import 'package:track/features/expense/domain/use_cases/modify_transaction.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactions _getTransactions;
  final AddTransaction _addTransaction;
  final UpdateTransaction _updateTransaction;

  TransactionsBloc(this._getTransactions, this._addTransaction, this._updateTransaction) : super(const TransactionsState.initial()) {
    on<_TransactionsLoad>(_onLoad);
    on<_TransactionsAdd>(_onAdd);
    on<_TransactionsUpdate>(_onUpdate);
  }

  Future<void> _onLoad(_TransactionsLoad event, Emitter<TransactionsState> emit) async {
    emit(const TransactionsState.loading());
    
    logger.info('Loading transactions for user: ${event.uid}', tag: 'TransactionsBloc');
    final stopwatch = Stopwatch()..start();

    final result = await _getTransactions.call(
      uid: event.uid,
      from: event.from,
      to: event.to,
    );
    
    result.fold(
      (failure) {
        stopwatch.stop();
        emit(TransactionsState.failure(failure.message));
        logger.logFailure(
          failure,
          operation: 'loadTransactions',
          userId: event.uid,
          context: {'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'load_transactions_failed',
          userId: event.uid,
          screen: 'transactions_page',
          parameters: {'error': failure.message, 'errorCode': failure.code},
        );
      },
      (transactions) {
        stopwatch.stop();
        emit(TransactionsState.loaded(transactions));
        logger.logSuccess(
          'Load transactions',
          userId: event.uid,
          context: {'transactionCount': transactions.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'load_transactions_success',
          userId: event.uid,
          screen: 'transactions_page',
          parameters: {'transactionCount': transactions.length},
        );
      },
    );
  }

  Future<void> _onAdd(_TransactionsAdd event, Emitter<TransactionsState> emit) async {
    logger.info('Adding transaction: ${event.transaction.note}', tag: 'TransactionsBloc');
    final stopwatch = Stopwatch()..start();

    final result = await _addTransaction.call(transaction: event.transaction);

    result.fold(
      (failure) {
        stopwatch.stop();
        emit(TransactionsState.failure(failure.message));
        logger.logFailure(
          failure,
          operation: 'addTransaction',
          userId: event.transaction.uid,
          context: {'transactionDescription': event.transaction.note, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'add_transaction_failed',
          userId: event.transaction.uid,
          screen: 'transactions_page',
          parameters: {'error': failure.message, 'transactionDescription': event.transaction.note},
        );
      },
      (_) {
        stopwatch.stop();
        logger.logSuccess(
          'Add transaction',
          userId: event.transaction.uid,
          context: {'transactionDescription': event.transaction.note, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'add_transaction_success',
          userId: event.transaction.uid,
          screen: 'transactions_page',
          parameters: {'transactionDescription': event.transaction.note},
        );
        add(TransactionsEvent.load(uid: event.transaction.uid));
      },
    );
  }

  Future<void> _onUpdate(_TransactionsUpdate event, Emitter<TransactionsState> emit) async {
    logger.info('Updating transaction: ${event.transaction.transactionId}', tag: 'TransactionsBloc');
    final stopwatch = Stopwatch()..start();

    final result = await _updateTransaction.call(transaction: event.transaction);

    result.fold(
      (failure) {
        stopwatch.stop();
        emit(TransactionsState.failure(failure.message));
        logger.logFailure(
          failure,
          operation: 'updateTransaction',
          userId: event.transaction.uid,
          context: {'transactionId': event.transaction.transactionId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'update_transaction_failed',
          userId: event.transaction.uid,
          screen: 'transactions_page',
          parameters: {'error': failure.message, 'transactionId': event.transaction.transactionId},
        );
      },
      (_) {
        stopwatch.stop();
        logger.logSuccess(
          'Update transaction',
          userId: event.transaction.uid,
          context: {'transactionId': event.transaction.transactionId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        logger.logUserAction(
          'update_transaction_success',
          userId: event.transaction.uid,
          screen: 'transactions_page',
          parameters: {'transactionId': event.transaction.transactionId},
        );
        add(TransactionsEvent.load(uid: event.transaction.uid));
      },
    );
  }
}


