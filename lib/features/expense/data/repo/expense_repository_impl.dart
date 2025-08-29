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

  TransactionType _mapTransactionTypeModelToEntity(
      TransactionTypeModel typeModel) {
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
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(
      {required String uid, DateTime? from, DateTime? to}) async {
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
      final rows = await _db.query('transactions',
          where: where.toString(), whereArgs: args);
      // Prefetch factors for currencies in result set
      final Set<String> currencies = {
        for (final r in rows)
          if (r['currency'] != null) r['currency'] as String
      };
      final Map<String, int> factors =
          await _loadCurrencyMinorFactors(currencies);
      final transactions = rows.map((r) {
        // Convert amount_minor -> amount in display units
        final currency = r['currency'] as String;
        final minor = r['amount_minor'];
        final factor = factors[currency] ?? 100;
        final amountDisplay = _minorToDisplayWithFactor(minor, factor: factor);
        final json = Map<String, Object?>.from(r);
        json['amount'] = amountDisplay;
        return _transactionModelToEntity(TransactionModel.fromJson(json));
      }).toList();

      stopwatch.stop();
      logger.logSuccess(
        'Get transactions',
        userId: uid,
        context: {
          'transactionCount': transactions.length,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, void>> addTransaction(
      {required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Adding transaction: ${transaction.note}',
          tag: 'ExpenseRepo');

      final transactionModel = _transactionEntityToModel(transaction);
      final data = transactionModel.toJson();
      // Store amount in minor units
      final factorMap = await _loadCurrencyMinorFactors({transaction.currency});
      final factor = factorMap[transaction.currency] ?? 100;
      final minor =
          _displayToMinorWithFactor(transaction.amount, factor: factor);
      data.remove('amount');
      data['amount_minor'] = minor;
      await _db.insert('transactions', data);

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
  Future<Either<Failure, void>> updateTransaction(
      {required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Updating transaction: ${transaction.transactionId}',
          tag: 'ExpenseRepo');

      final transactionModel = _transactionEntityToModel(transaction);
      final data = transactionModel.toJson();
      final factorMap = await _loadCurrencyMinorFactors({transaction.currency});
      final factor = factorMap[transaction.currency] ?? 100;
      final minor =
          _displayToMinorWithFactor(transaction.amount, factor: factor);
      data.remove('amount');
      data['amount_minor'] = minor;
      await _db.update('transactions', data,
          where: 'transaction_id = ?', whereArgs: [transaction.transactionId]);

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

  int _displayToMinorWithFactor(double amount, {required int factor}) {
    return (amount * factor).round();
  }

  Future<Map<String, int>> _loadCurrencyMinorFactors(Set<String> codes) async {
    if (codes.isEmpty) return {};
    final placeholders = List.filled(codes.length, '?').join(',');
    final rows = await _db.rawQuery(
      'SELECT code, minor_unit FROM currencies WHERE code IN ($placeholders)',
      codes.toList(),
    );
    final Map<String, int> map = {};
    for (final r in rows) {
      final code = r['code'] as String?;
      final mu = r['minor_unit'];
      if (code == null) continue;
      final digits = (mu is int) ? mu : int.tryParse(mu.toString()) ?? 2;
      int factor = 1;
      for (int i = 0; i < digits; i++) factor *= 10;
      map[code] = factor;
    }
    return map;
  }

  double _minorToDisplayWithFactor(Object? minorValue, {required int factor}) {
    final minor = (minorValue is int)
        ? minorValue
        : (minorValue is num)
            ? minorValue.toInt()
            : int.tryParse(minorValue?.toString() ?? '0') ?? 0;
    return minor / factor;
  }
}
