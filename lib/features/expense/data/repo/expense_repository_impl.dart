import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/expense_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/data/models/raw_models/category_model.dart';
import 'package:track/features/expense/data/models/raw_models/transaction_model.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource local;
  ExpenseRepositoryImpl(this.local);

  Database get _db => local.db;

  // --- Mapping helpers ---
  AccountModel _accountEntityToModel(AccountEntity entity) {
    return AccountModel(
      accountId: entity.accountId,
      uid: entity.uid,
      name: entity.name,
      type: _mapAccountTypeToModel(entity.type),
      currency: entity.currency,
      isArchived: entity.isArchived,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  AccountEntity _accountModelToEntity(AccountModel model) {
    return AccountEntity(
      accountId: model.accountId,
      uid: model.uid,
      name: model.name,
      type: _mapAccountTypeModelToEntity(model.type),
      currency: model.currency,
      isArchived: model.isArchived,
      isDefault: model.isDefault,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  AccountTypeModel _mapAccountTypeToModel(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return AccountTypeModel.cash;
      case AccountType.bank:
        return AccountTypeModel.bank;
      case AccountType.card:
        return AccountTypeModel.card;
      case AccountType.ewallet:
        return AccountTypeModel.ewallet;
      case AccountType.other:
        return AccountTypeModel.other;
    }
  }

  AccountType _mapAccountTypeModelToEntity(AccountTypeModel typeModel) {
    switch (typeModel) {
      case AccountTypeModel.cash:
        return AccountType.cash;
      case AccountTypeModel.bank:
        return AccountType.bank;
      case AccountTypeModel.card:
        return AccountType.card;
      case AccountTypeModel.ewallet:
        return AccountType.ewallet;
      case AccountTypeModel.other:
        return AccountType.other;
    }
  }

  CategoryModel _categoryEntityToModel(CategoryEntity entity) {
    return CategoryModel(
      categoryId: entity.categoryId,
      uid: entity.uid,
      name: entity.name,
      type: _mapCategoryTypeToModel(entity.type),
      parentId: entity.parentId,
      icon: entity.icon,
      sortOrder: entity.sortOrder,
    );
  }

  CategoryEntity _categoryModelToEntity(CategoryModel model) {
    return CategoryEntity(
      categoryId: model.categoryId,
      uid: model.uid,
      name: model.name,
      type: _mapCategoryTypeModelToEntity(model.type),
      parentId: model.parentId,
      icon: model.icon,
      sortOrder: model.sortOrder,
    );
  }

  CategoryTypeModel _mapCategoryTypeToModel(CategoryType type) {
    switch (type) {
      case CategoryType.expense:
        return CategoryTypeModel.expense;
      case CategoryType.income:
        return CategoryTypeModel.income;
    }
  }

  CategoryType _mapCategoryTypeModelToEntity(CategoryTypeModel typeModel) {
    switch (typeModel) {
      case CategoryTypeModel.expense:
        return CategoryType.expense;
      case CategoryTypeModel.income:
        return CategoryType.income;
    }
  }

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
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Fetching accounts for user: $uid', tag: 'ExpenseRepo');
      
      final rows = await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
      final accounts = rows.map((r) => _accountModelToEntity(AccountModel.fromJson(r))).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get accounts',
        userId: uid,
        context: {'accountCount': accounts.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      logger.logPerformance(
        'Get accounts',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      logger.logDatabaseOperation(
        'SELECT',
        table: 'accounts',
        userId: uid,
        duration: stopwatch.elapsed,
      );
      
      return EitherUtils.right(accounts);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to fetch accounts',
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccounts',
        userId: uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to fetch accounts',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addAccount({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Adding account: ${account.name}', tag: 'ExpenseRepo');
      
      // If this account is being set as default, first remove default from all other accounts
      if (account.isDefault) {
        await _db.update(
          'accounts',
          {'is_default': 0},
          where: 'uid = ?',
          whereArgs: [account.uid],
        );
      }
      
      final accountModel = _accountEntityToModel(account);
      await _db.insert('accounts', accountModel.toJson());
      
      stopwatch.stop();
      logger.logSuccess(
        'Add account',
        userId: account.uid,
        context: {'accountName': account.name, 'accountType': account.type.toString()},
      );
      logger.logPerformance(
        'Add account',
        duration: stopwatch.elapsed,
        userId: account.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to add account: ${account.name}',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'addAccount',
        userId: account.uid,
        context: {'accountName': account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to add account',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Updating account: ${account.name}', tag: 'ExpenseRepo');
      
      // If this account is being set as default, first remove default from all other accounts
      if (account.isDefault) {
        await _db.update(
          'accounts',
          {'is_default': 0},
          where: 'uid = ? AND account_id != ?',
          whereArgs: [account.uid, account.accountId],
        );
      }
      
      final accountModel = _accountEntityToModel(account);
      await _db.update(
        'accounts',
        accountModel.toJson(),
        where: 'account_id = ?',
        whereArgs: [account.accountId],
      );
      
      stopwatch.stop();
      logger.logSuccess(
        'Update account',
        userId: account.uid,
        context: {'accountId': account.accountId, 'accountName': account.name},
      );
      logger.logPerformance(
        'Update account',
        duration: stopwatch.elapsed,
        userId: account.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to update account: ${account.name}',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'updateAccount',
        userId: account.uid,
        context: {'accountId': account.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to update account',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Fetching categories for user: $uid', tag: 'ExpenseRepo');
      
      final rows = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
      final categories = rows.map((r) => _categoryModelToEntity(CategoryModel.fromJson(r))).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get categories',
        userId: uid,
        context: {'categoryCount': categories.length, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      logger.logPerformance(
        'Get categories',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      logger.logDatabaseOperation(
        'SELECT',
        table: 'categories',
        userId: uid,
        duration: stopwatch.elapsed,
      );
      
      return EitherUtils.right(categories);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to fetch categories',
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getCategories',
        userId: uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to fetch categories',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addCategory({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Adding category: ${category.name}', tag: 'ExpenseRepo');
      
      final categoryModel = _categoryEntityToModel(category);
      await _db.insert('categories', categoryModel.toJson());
      
      stopwatch.stop();
      logger.logSuccess(
        'Add category',
        userId: category.uid,
        context: {'categoryName': category.name, 'categoryType': category.type.toString()},
      );
      logger.logPerformance(
        'Add category',
        duration: stopwatch.elapsed,
        userId: category.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to add category: ${category.name}',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'addCategory',
        userId: category.uid,
        context: {'categoryName': category.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to add category',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory({required CategoryEntity category}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Updating category: ${category.name}', tag: 'ExpenseRepo');
      
      final categoryModel = _categoryEntityToModel(category);
      await _db.update('categories', categoryModel.toJson(), where: 'category_id = ?', whereArgs: [category.categoryId]);
      
      stopwatch.stop();
      logger.logSuccess(
        'Update category',
        userId: category.uid,
        context: {'categoryId': category.categoryId, 'categoryName': category.name},
      );
      logger.logPerformance(
        'Update category',
        duration: stopwatch.elapsed,
        userId: category.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        CategoryFailure(
          'Failed to update category: ${category.name}',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'updateCategory',
        userId: category.uid,
        context: {'categoryId': category.categoryId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        CategoryFailure(
          'Failed to update category',
          categoryId: category.categoryId?.toString(),
          categoryName: category.name,
          categoryType: category.type.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
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


