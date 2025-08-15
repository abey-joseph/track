import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/data/data_source/expense_local_data_source.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/payee_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource _localDataSource;

  ExpenseRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<TransactionEntity>>> getRecentTransactions({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  }) async {
    try {
      final transactions = await _localDataSource.getRecentTransactions(
        uid: uid,
        limit: limit,
        dayCount: dayCount,
      );

      return Right(transactions.map(_mapTransactionModelToEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTransactionCountInPeriod({
    required String uid,
    required int dayCount,
  }) async {
    try {
      final count = await _localDataSource.getTransactionCountInPeriod(
        uid: uid,
        dayCount: dayCount,
      );

      return Right(count);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTodayTransactions({
    required String uid,
    int limit = 10,
  }) async {
    try {
      final transactions = await _localDataSource.getTodayTransactions(
        uid: uid,
        limit: limit,
      );

      return Right(transactions.map(_mapTransactionModelToEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> createTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final model = _mapTransactionEntityToModel(transaction);
      final createdModel = await _localDataSource.createTransaction(model);

      return Right(_mapTransactionModelToEntity(createdModel));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> updateTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final model = _mapTransactionEntityToModel(transaction);
      final updatedModel = await _localDataSource.updateTransaction(model);

      return Right(_mapTransactionModelToEntity(updatedModel));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(int transactionId) async {
    try {
      await _localDataSource.deleteTransaction(transactionId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts(String uid) async {
    try {
      final accounts = await _localDataSource.getAccounts(uid);
      return Right(accounts.map(_mapAccountModelToEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> getAccountById(int accountId) async {
    try {
      final account = await _localDataSource.getAccountById(accountId);
      return Right(_mapAccountModelToEntity(account));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories(String uid) async {
    try {
      final categories = await _localDataSource.getCategories(uid);
      return Right(categories.map(_mapCategoryModelToEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PayeeEntity>>> getPayees(String uid) async {
    try {
      final payees = await _localDataSource.getPayees(uid);
      return Right(payees.map(_mapPayeeModelToEntity).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  // Mapping methods
  TransactionEntity _mapTransactionModelToEntity(dynamic model) {
    return TransactionEntity(
      transactionId: model.transactionId,
      uid: model.uid,
      accountId: model.accountId,
      type: _mapTransactionTypeFromModel(model.type),
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

  dynamic _mapTransactionEntityToModel(TransactionEntity entity) {
    // Note: This would need to import the TransactionModel and create it properly
    // For now, returning a map structure
    return {
      'transaction_id': entity.transactionId,
      'uid': entity.uid,
      'account_id': entity.accountId,
      'type': _mapTransactionTypeToModel(entity.type),
      'amount': entity.amount,
      'currency': entity.currency,
      'category_id': entity.categoryId,
      'payee_id': entity.payeeId,
      'note': entity.note,
      'occurred_on': entity.occurredOn.toIso8601String(),
      'occurred_at': entity.occurredAt?.toIso8601String(),
      'transfer_group_id': entity.transferGroupId,
      'has_split': entity.hasSplit ? 1 : 0,
      'created_at': entity.createdAt.toIso8601String(),
      'updated_at': entity.updatedAt?.toIso8601String(),
    };
  }

  AccountEntity _mapAccountModelToEntity(dynamic model) {
    return AccountEntity(
      accountId: model.accountId,
      uid: model.uid,
      name: model.name,
      type: _mapAccountTypeFromModel(model.type),
      currency: model.currency,
      isArchived: model.isArchived,
      isDefault: model.isDefault,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  CategoryEntity _mapCategoryModelToEntity(dynamic model) {
    return CategoryEntity(
      categoryId: model.categoryId,
      uid: model.uid,
      name: model.name,
      type: _mapCategoryTypeFromModel(model.type),
      parentId: model.parentId,
      icon: model.icon,
      sortOrder: model.sortOrder,
    );
  }

  PayeeEntity _mapPayeeModelToEntity(dynamic model) {
    return PayeeEntity(
      payeeId: model.payeeId,
      uid: model.uid,
      name: model.name,
      normalized: model.normalized,
    );
  }

  // Type mapping helpers
  TransactionType _mapTransactionTypeFromModel(dynamic type) {
    switch (type.toString().toLowerCase()) {
      case 'expense':
        return TransactionType.expense;
      case 'income':
        return TransactionType.income;
      case 'transfer':
        return TransactionType.transfer;
      default:
        return TransactionType.expense;
    }
  }

  String _mapTransactionTypeToModel(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return 'EXPENSE';
      case TransactionType.income:
        return 'INCOME';
      case TransactionType.transfer:
        return 'TRANSFER';
    }
  }

  AccountType _mapAccountTypeFromModel(dynamic type) {
    switch (type.toString().toLowerCase()) {
      case 'cash':
        return AccountType.cash;
      case 'bank':
        return AccountType.bank;
      case 'card':
        return AccountType.card;
      case 'ewallet':
        return AccountType.ewallet;
      case 'other':
        return AccountType.other;
      default:
        return AccountType.other;
    }
  }

  CategoryType _mapCategoryTypeFromModel(dynamic type) {
    switch (type.toString().toLowerCase()) {
      case 'expense':
        return CategoryType.expense;
      case 'income':
        return CategoryType.income;
      default:
        return CategoryType.expense;
    }
  }
}
