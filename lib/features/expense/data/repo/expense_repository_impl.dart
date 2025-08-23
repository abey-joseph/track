import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/expense_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/transaction_model.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource local;
  ExpenseRepositoryImpl(this.local);

  Database get _db => local.db;

  // --- Mapping helpers ---
  TransactionModel _transactionEntityToModel(TransactionEntity entity) {
    return TransactionModel(
      transactionId: entity.transactionId,
      uid: entity.uid,
      accountId: entity.accountId,
      type: _mapTransactionTypeToModel(entity.type),
      amount: entity.amount,
      currency: entity.currency,
      categoryId: entity.categoryId,
      payeeId: entity.payeeId,
      note: entity.note,
      occurredOn: entity.occurredOn,
      occurredAt: entity.occurredAt,
      transferGroupId: entity.transferGroupId,
      hasSplit: entity.hasSplit,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  TransactionEntity _transactionModelToEntity(TransactionModel model) {
    return TransactionEntity(
      transactionId: model.transactionId,
      uid: model.uid,
      accountId: model.accountId,
      type: _mapTransactionTypeModelToEntity(model.type),
      amount: model.amount,
      currency: model.currency,
      categoryId: model.categoryId,
      payeeId: model.payeeId,
      note: model.note,
      occurredOn: model.occurredOn,
      occurredAt: model.occurredAt,
      transferGroupId: model.transferGroupId,
      hasSplit: model.hasSplit,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  TransactionTypeModel _mapTransactionTypeToModel(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return TransactionTypeModel.expense;
      case TransactionType.income:
        return TransactionTypeModel.income;
      case TransactionType.transfer:
        return TransactionTypeModel.transfer;
    }
  }

  TransactionType _mapTransactionTypeModelToEntity(TransactionTypeModel typeModel) {
    switch (typeModel) {
      case TransactionTypeModel.expense:
        return TransactionType.expense;
      case TransactionTypeModel.income:
        return TransactionType.income;
      case TransactionTypeModel.transfer:
        return TransactionType.transfer;
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions({required String uid, DateTime? from, DateTime? to}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Fetching transactions for user: $uid', tag: 'ExpenseRepo');
      
      final where = StringBuffer('uid = ?');
      final args = <Object?>[uid];
      if (from != null) {
        where.write(' AND occurred_on >= ?');
        args.add(_fmt(from));
      }
      if (to != null) {
        where.write(' AND occurred_on <= ?');
        args.add(_fmt(to));
      }
      final rows = await _db.query('transactions', where: where.toString(), whereArgs: args);
      final transactions = rows.map((r) => _transactionModelToEntity(TransactionModel.fromJson(r))).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get transactions',
        userId: uid,
        context: {'transactionCount': transactions.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      logger.logPerformance(
        'Get transactions',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      logger.logDatabaseOperation(
        'SELECT',
        table: 'transactions',
        userId: uid,
        duration: stopwatch.elapsed,
      );
      
      return EitherUtils.right(transactions);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        TransactionFailure(
          'Failed to fetch transactions',
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getTransactions',
        userId: uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        TransactionFailure(
          'Failed to fetch transactions',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addTransaction({required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Adding transaction: ${transaction.note}', tag: 'ExpenseRepo');
      
      final transactionModel = _transactionEntityToModel(transaction);
      await _db.insert('transactions', transactionModel.toJson());
      
      stopwatch.stop();
      logger.logSuccess(
        'Add transaction',
        userId: transaction.uid,
        context: {
          'transactionId': transaction.transactionId,
          'amount': transaction.amount,
          'type': transaction.type.toString(),
          'note': transaction.note,
          'durationMs': stopwatch.elapsed.inMilliseconds,
        },
      );
      logger.logPerformance(
        'Add transaction',
        duration: stopwatch.elapsed,
        userId: transaction.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        TransactionFailure(
          'Failed to add transaction: ${transaction.note}',
          transactionId: transaction.transactionId?.toString(),
          accountId: transaction.accountId.toString(),
          categoryId: transaction.categoryId?.toString(),
          amount: transaction.amount,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'addTransaction',
        userId: transaction.uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        TransactionFailure(
          'Failed to add transaction',
          transactionId: transaction.transactionId?.toString(),
          accountId: transaction.accountId.toString(),
          categoryId: transaction.categoryId?.toString(),
          amount: transaction.amount,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateTransaction({required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Updating transaction: ${transaction.transactionId}', tag: 'ExpenseRepo');
      
      final transactionModel = _transactionEntityToModel(transaction);
      await _db.update('transactions', transactionModel.toJson(), where: 'transaction_id = ?', whereArgs: [transaction.transactionId]);
      
      stopwatch.stop();
      logger.logSuccess(
        'Update transaction',
        userId: transaction.uid,
        context: {
          'transactionId': transaction.transactionId,
          'amount': transaction.amount,
          'type': transaction.type.toString(),
          'note': transaction.note,
          'durationMs': stopwatch.elapsed.inMilliseconds,
        },
      );
      logger.logPerformance(
        'Update transaction',
        duration: stopwatch.elapsed,
        userId: transaction.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        TransactionFailure(
          'Failed to update transaction: ${transaction.transactionId}',
          transactionId: transaction.transactionId?.toString(),
          accountId: transaction.accountId.toString(),
          categoryId: transaction.categoryId?.toString(),
          amount: transaction.amount,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'updateTransaction',
        userId: transaction.uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        TransactionFailure(
          'Failed to update transaction',
          transactionId: transaction.transactionId?.toString(),
          accountId: transaction.accountId.toString(),
          categoryId: transaction.categoryId?.toString(),
          amount: transaction.amount,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  String _fmt(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '${d.year}-$mm-$dd';
  }
}


