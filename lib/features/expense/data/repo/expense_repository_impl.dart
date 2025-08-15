import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/data/data_source/expense_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/transaction_model.dart'
    as tx_model;
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/payee_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart' as tx_model;
import 'package:track/features/expense/data/models/raw_models/payee_model.dart' as tx_model;

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
  Future<Either<Failure, AccountEntity>> createAccount(
      AccountEntity account) async {
    try {
      final model = _mapAccountEntityToModel(account);
      final created = await _localDataSource.createAccount(model);
      return Right(_mapAccountModelToEntity(created));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> updateAccount(
      AccountEntity account) async {
    try {
      final model = _mapAccountEntityToModel(account);
      final updated = await _localDataSource.updateAccount(model);
      return Right(_mapAccountModelToEntity(updated));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(int accountId) async {
    try {
      await _localDataSource.deleteAccount(accountId);
      return const Right(null);
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

  @override
  Future<Either<Failure, PayeeEntity>> createPayee(PayeeEntity payee) async {
    try {
      final model = _mapPayeeEntityToModel(payee);
      final created = await _localDataSource.createPayee(model);
      return Right(_mapPayeeModelToEntity(created));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PayeeEntity>> updatePayee(PayeeEntity payee) async {
    try {
      final model = _mapPayeeEntityToModel(payee);
      final updated = await _localDataSource.updatePayee(model);
      return Right(_mapPayeeModelToEntity(updated));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePayee(int payeeId) async {
    try {
      await _localDataSource.deletePayee(payeeId);
      return const Right(null);
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

  // Use the concrete model type instead of a loosely typed map
  tx_model.TransactionModel _mapTransactionEntityToModel(
    TransactionEntity entity,
  ) {
    final modelType = _mapTransactionTypeToModel(entity.type);
    return tx_model.TransactionModel(
      transactionId: entity.transactionId,
      uid: entity.uid,
      accountId: entity.accountId,
      type: modelType,
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

  // Helpers to map entities to models for create/update
  tx_model.AccountModel _mapAccountEntityToModel(AccountEntity entity) {
    final type = _mapAccountTypeToModel(entity.type);
    return tx_model.AccountModel(
      accountId: entity.accountId,
      uid: entity.uid,
      name: entity.name,
      type: type,
      currency: entity.currency,
      isArchived: entity.isArchived,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
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

  tx_model.PayeeModel _mapPayeeEntityToModel(PayeeEntity entity) {
    return tx_model.PayeeModel(
      payeeId: entity.payeeId,
      uid: entity.uid,
      name: entity.name,
      normalized: entity.normalized,
    );
  }

  // Type mapping helpers
  TransactionType _mapTransactionTypeFromModel(dynamic type) {
    // Handle both enum and string inputs defensively
    if (type is tx_model.TransactionTypeModel) {
      switch (type) {
        case tx_model.TransactionTypeModel.expense:
          return TransactionType.expense;
        case tx_model.TransactionTypeModel.income:
          return TransactionType.income;
        case tx_model.TransactionTypeModel.transfer:
          return TransactionType.transfer;
      }
    }
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

  tx_model.TransactionTypeModel _mapTransactionTypeToModel(
    TransactionType type,
  ) {
    switch (type) {
      case TransactionType.expense:
        return tx_model.TransactionTypeModel.expense;
      case TransactionType.income:
        return tx_model.TransactionTypeModel.income;
      case TransactionType.transfer:
        return tx_model.TransactionTypeModel.transfer;
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

  tx_model.AccountTypeModel _mapAccountTypeToModel(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return tx_model.AccountTypeModel.cash;
      case AccountType.bank:
        return tx_model.AccountTypeModel.bank;
      case AccountType.card:
        return tx_model.AccountTypeModel.card;
      case AccountType.ewallet:
        return tx_model.AccountTypeModel.ewallet;
      case AccountType.other:
        return tx_model.AccountTypeModel.other;
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
