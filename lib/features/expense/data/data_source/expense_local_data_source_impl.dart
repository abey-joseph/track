import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/database/database/app_database.dart';
import 'package:track/features/expense/data/data_source/expense_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/transaction_model.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/data/models/raw_models/category_model.dart';
import 'package:track/features/expense/data/models/raw_models/payee_model.dart';

@LazySingleton(as: ExpenseLocalDataSource)
class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final AppDatabase _database;

  ExpenseLocalDataSourceImpl(this._database);

  @override
  Future<List<TransactionModel>> getRecentTransactions({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  }) async {
    log('🔍 [ExpenseLocalDataSource] Fetching recent transactions: uid=$uid, limit=$limit, dayCount=$dayCount'); // TODO: Remove log
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      log('User not found with uid: $uid');
      return [];
    }
    
    final userId = userResult.first['user_id'] as int;
    log('🔍 [ExpenseLocalDataSource] Found user_id: $userId for uid: $uid');
    
    // Debug: Check what transactions exist for this user_id
    final debugTransactions = await db.query(
      'transactions',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    log('🔍 [ExpenseLocalDataSource] Debug: Found ${debugTransactions.length} transactions for user_id: $userId');
    for (final tx in debugTransactions.take(3)) {
      log('  Debug Transaction: $tx');
    }
    
    final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT 
        t.*,
        c.name as category_name,
        c.icon as category_icon,
        p.name as payee_name,
        a.name as account_name
      FROM transactions t
      LEFT JOIN categories c ON t.category_id = c.category_id
      LEFT JOIN payees p ON t.payee_id = p.payee_id
      LEFT JOIN accounts a ON t.account_id = a.account_id
      WHERE t.user_id = ? 
        AND t.occurred_on >= date('now', '-$dayCount days')
      ORDER BY t.occurred_on DESC, t.created_at DESC
      LIMIT ?
    ''', [userId, limit]);

    log('📊 [ExpenseLocalDataSource] Found ${results.length} transactions:'); // TODO: Remove log
    for (var result in results.take(3)) {
      log('   - ID: ${result['transaction_id']}, Amount: ${result['amount']}, Note: ${result['note']}'); // TODO: Remove log
    }
    
    // Debug: Check what the date filter is actually doing
    final allTransactions = await db.rawQuery('''
      SELECT 
        t.transaction_id,
        t.occurred_on,
        t.amount,
        t.note,
        date('now') as current_date,
        date('now', '-$dayCount days') as filter_date
      FROM transactions t
      WHERE t.user_id = ?
      ORDER BY t.occurred_on DESC
    ''', [userId]);
    
    log('🔍 [ExpenseLocalDataSource] Date filter debug:');
    log('  Current date: ${allTransactions.isNotEmpty ? allTransactions.first['current_date'] : 'N/A'}');
    log('  Filter date ($dayCount days ago): ${allTransactions.isNotEmpty ? allTransactions.first['filter_date'] : 'N/A'}');
    log('  All transactions for user_id $userId:');
    for (final tx in allTransactions.take(5)) {
      log('    ID: ${tx['transaction_id']}, Date: ${tx['occurred_on']}, Amount: ${tx['amount']}, Note: ${tx['note']}');
    }
    
    // Convert rows to models, normalizing SQLite 0/1 -> bool for has_split
    final transactions = results.map((row) {
      final normalized = Map<String, dynamic>.from(row);
      final hasSplit = row['has_split'];
      if (hasSplit is int) normalized['has_split'] = hasSplit != 0;
      return TransactionModel.fromJson(normalized);
    }).toList();

    return transactions;
  }

  @override
  Future<int> getTransactionCountInPeriod({
    required String uid,
    required int dayCount,
  }) async {
    log('🔢 [ExpenseLocalDataSource] Counting transactions in ${dayCount}D for uid: $uid'); // TODO: Remove log
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      log('User not found with uid: $uid');
      return 0;
    }
    
    final userId = userResult.first['user_id'] as int;
    log('🔢 [ExpenseLocalDataSource] Found user_id: $userId for uid: $uid');
    
    // Debug: Check what transactions exist for this user_id
    final debugTransactions = await db.query(
      'transactions',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    log('🔢 [ExpenseLocalDataSource] Debug: Found ${debugTransactions.length} total transactions for user_id: $userId');
    
    final result = await db.rawQuery('''
      SELECT COUNT(*) as count
      FROM transactions 
      WHERE user_id = ? 
        AND occurred_on >= date('now', '-$dayCount days')
    ''', [userId]);

    final count = Sqflite.firstIntValue(result) ?? 0;
    log('📊 [ExpenseLocalDataSource] Transaction count: $count'); // TODO: Remove log
    
    // Debug: Check what the date filter is actually doing
    final allTransactions = await db.rawQuery('''
      SELECT 
        t.transaction_id,
        t.occurred_on,
        t.amount,
        t.note,
        date('now') as current_date,
        date('now', '-$dayCount days') as filter_date,
        t.has_split
      FROM transactions t
      WHERE t.user_id = ?
      ORDER BY t.occurred_on DESC
    ''', [userId]);
    
    log('🔢 [ExpenseLocalDataSource] Date filter debug for count:');
    log('  Current date: ${allTransactions.isNotEmpty ? allTransactions.first['current_date'] : 'N/A'}');
    log('  Filter date ($dayCount days ago): ${allTransactions.isNotEmpty ? allTransactions.first['filter_date'] : 'N/A'}');
    log('  All transactions for user_id $userId:');
    for (final tx in allTransactions.take(5)) {
      log('    ID: ${tx['transaction_id']}, Date: ${tx['occurred_on']}, Amount: ${tx['amount']}, Note: ${tx['note']}');
    }
    
    // Test the exact date filter query
    final testDateFilter = await db.rawQuery('''
      SELECT 
        t.transaction_id,
        t.occurred_on,
        date('now') as current_date,
        date('now', '-$dayCount days') as filter_date,
        CASE 
          WHEN t.occurred_on >= date('now', '-$dayCount days') THEN 'PASSES_FILTER'
          ELSE 'FAILS_FILTER'
        END as filter_result,
        t.has_split
      FROM transactions t
      WHERE t.user_id = ?
      ORDER BY t.occurred_on DESC
    ''', [userId]);
    
    log('🔢 [ExpenseLocalDataSource] Date filter test results:');
    for (final tx in testDateFilter.take(5)) {
      log('    ID: ${tx['transaction_id']}, Date: ${tx['occurred_on']}, Filter: ${tx['filter_result']}');
    }
    
    return count;
  }

  @override
  Future<List<TransactionModel>> getTodayTransactions({
    required String uid,
    int limit = 10,
  }) async {
    log('📅 [ExpenseLocalDataSource] Fetching today transactions: uid=$uid, limit=$limit'); // TODO: Remove log
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      log('User not found with uid: $uid');
      return [];
    }
    
    final userId = userResult.first['user_id'] as int;
    
    final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT 
        t.*,
        c.name as category_name,
        c.icon as category_icon,
        p.name as payee_name,
        a.name as account_name
      FROM transactions t
      LEFT JOIN categories c ON t.category_id = c.category_id
      LEFT JOIN payees p ON t.payee_id = p.payee_id
      LEFT JOIN accounts a ON t.account_id = a.account_id
      WHERE t.user_id = ? 
        AND date(t.occurred_on) = date('now')
      ORDER BY t.occurred_at DESC, t.created_at DESC
      LIMIT ?
    ''', [userId, limit]);

    log('📊 [ExpenseLocalDataSource] Found ${results.length} today transactions'); // TODO: Remove log
    
    final today = results.map((row) {
      final normalized = Map<String, dynamic>.from(row);
      final hasSplit = row['has_split'];
      if (hasSplit is int) normalized['has_split'] = hasSplit != 0;
      return TransactionModel.fromJson(normalized);
    }).toList();
    
    return today;
  }

  @override
  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [transaction.uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      throw Exception('User not found with uid: ${transaction.uid}');
    }
    
    final userId = userResult.first['user_id'] as int;
    
    // Create a map with both uid and user_id
    final transactionData = transaction.toJson()..remove('transaction_id');
    transactionData['user_id'] = userId;
    // Normalize bools to ints for SQLite compatibility
    final hs = transactionData['has_split'];
    if (hs is bool) transactionData['has_split'] = hs ? 1 : 0;
    
    final id = await db.insert(
      'transactions',
      transactionData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return transaction.copyWith(transactionId: id);
  }

  @override
  Future<TransactionModel> updateTransaction(TransactionModel transaction) async {
    final db = _database.instance;
    // Normalize bools to ints for SQLite compatibility
    final updateData = transaction.toJson();
    final hs = updateData['has_split'];
    if (hs is bool) updateData['has_split'] = hs ? 1 : 0;

    await db.update(
      'transactions',
      updateData,
      where: 'transaction_id = ?',
      whereArgs: [transaction.transactionId],
    );

    return transaction;
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    final db = _database.instance;
    
    await db.delete(
      'transactions',
      where: 'transaction_id = ?',
      whereArgs: [transactionId],
    );
  }

  @override
  Future<List<AccountModel>> getAccounts(String uid) async {
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      return [];
    }
    
    final userId = userResult.first['user_id'] as int;
    
    final List<Map<String, dynamic>> results = await db.query(
      'accounts',
      where: 'user_id = ? AND is_archived = 0',
      whereArgs: [userId],
      orderBy: 'name ASC',
    );

    return results.map((row) {
      final normalized = Map<String, dynamic>.from(row);
      final ia = normalized['is_archived'];
      final idf = normalized['is_default'];
      if (ia is int) normalized['is_archived'] = ia != 0;
      if (idf is int) normalized['is_default'] = idf != 0;
      final t = normalized['type'];
      if (t is String) normalized['type'] = t.toLowerCase();
      return AccountModel.fromJson(normalized);
    }).toList();
  }

  @override
  Future<AccountModel> getAccountById(int accountId) async {
    final db = _database.instance;
    
    final List<Map<String, dynamic>> results = await db.query(
      'accounts',
      where: 'account_id = ?',
      whereArgs: [accountId],
      limit: 1,
    );

    if (results.isEmpty) {
      throw Exception('Account not found');
    }

    final normalized = Map<String, dynamic>.from(results.first);
    final ia = normalized['is_archived'];
    final idf = normalized['is_default'];
    if (ia is int) normalized['is_archived'] = ia != 0;
    if (idf is int) normalized['is_default'] = idf != 0;
    final t = normalized['type'];
    if (t is String) normalized['type'] = t.toLowerCase();
    return AccountModel.fromJson(normalized);
  }

  @override
  Future<AccountModel> createAccount(AccountModel account) async {
    final db = _database.instance;

    // Resolve user_id from uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [account.uid],
      columns: ['user_id'],
    );

    if (userResult.isEmpty) {
      throw Exception('User not found with uid: ${account.uid}');
    }

    final userId = userResult.first['user_id'] as int;
    final data = account.toJson()..remove('account_id');
    data['user_id'] = userId;
    // Normalize unsupported types: bools -> ints; ensure type matches DB CHECK (uppercase)
    final ia = data['is_archived'];
    final idf = data['is_default'];
    if (ia is bool) data['is_archived'] = ia ? 1 : 0;
    if (idf is bool) data['is_default'] = idf ? 1 : 0;
    final t = data['type'];
    if (t is String) data['type'] = t.toUpperCase();

    final id = await db.insert('accounts', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return account.copyWith(accountId: id);
  }

  @override
  Future<AccountModel> updateAccount(AccountModel account) async {
    final db = _database.instance;
    final updateData = account.toJson();
    final ia = updateData['is_archived'];
    final idf = updateData['is_default'];
    if (ia is bool) updateData['is_archived'] = ia ? 1 : 0;
    if (idf is bool) updateData['is_default'] = idf ? 1 : 0;
    final t = updateData['type'];
    if (t is String) updateData['type'] = t.toUpperCase();

    await db.update(
      'accounts',
      updateData,
      where: 'account_id = ?',
      whereArgs: [account.accountId],
    );
    return account;
  }

  @override
  Future<void> deleteAccount(int accountId) async {
    final db = _database.instance;
    await db.delete(
      'accounts',
      where: 'account_id = ?',
      whereArgs: [accountId],
    );
  }

  @override
  Future<List<CategoryModel>> getCategories(String uid) async {
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      return [];
    }
    
    final userId = userResult.first['user_id'] as int;
    
    final List<Map<String, dynamic>> results = await db.query(
      'categories',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'type, sort_order, name',
    );

    return results.map((json) => CategoryModel.fromJson(json)).toList();
  }

  @override
  Future<List<PayeeModel>> getPayees(String uid) async {
    final db = _database.instance;
    
    // First get the user_id for this uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [uid],
      columns: ['user_id'],
    );
    
    if (userResult.isEmpty) {
      return [];
    }
    
    final userId = userResult.first['user_id'] as int;
    
    final List<Map<String, dynamic>> results = await db.query(
      'payees',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'name',
    );

    return results.map((json) => PayeeModel.fromJson(json)).toList();
  }

  @override
  Future<PayeeModel> createPayee(PayeeModel payee) async {
    final db = _database.instance;

    // Resolve user_id from uid
    final userResult = await db.query(
      'users',
      where: 'uid = ?',
      whereArgs: [payee.uid],
      columns: ['user_id'],
    );

    if (userResult.isEmpty) {
      throw Exception('User not found with uid: ${payee.uid}');
    }

    final userId = userResult.first['user_id'] as int;
    final data = payee.toJson()..remove('payee_id');
    data['user_id'] = userId;

    final id = await db.insert('payees', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return payee.copyWith(payeeId: id);
  }

  @override
  Future<PayeeModel> updatePayee(PayeeModel payee) async {
    final db = _database.instance;
    await db.update(
      'payees',
      payee.toJson(),
      where: 'payee_id = ?',
      whereArgs: [payee.payeeId],
    );
    return payee;
  }

  @override
  Future<void> deletePayee(int payeeId) async {
    final db = _database.instance;
    await db.delete(
      'payees',
      where: 'payee_id = ?',
      whereArgs: [payeeId],
    );
  }
}
