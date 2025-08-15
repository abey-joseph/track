import 'package:sqflite/sqflite.dart';
import 'dart:io'; // Added for File

/// Thin wrapper around an already-opened sqflite [Database].
/// The Database is created & migrated in DI (DbModule) and injected here.
class AppDatabase {
  AppDatabase(this._db);

  final Database _db;

  Database get instance => _db;

  Future<void> close() async {
    await _db.close();
  }

  /// Adds sample data for testing purposes
  /// Call this method manually to populate the database with test data
  Future<void> addSampleDataForUser(String uid) async {
    try {
      // First, get the user_id for this uid
      final userResult = await _db.query(
        'users',
        where: 'uid = ?',
        whereArgs: [uid],
        columns: ['user_id'],
      );
      
      if (userResult.isEmpty) {
        throw Exception('User not found with uid: $uid');
      }
      
      final userId = userResult.first['user_id'] as int;
      print('Found user_id: $userId for uid: $uid');

      // Check if sample data already exists
      final existingTransactions = await _db.query(
        'transactions',
        where: 'user_id = ?',
        whereArgs: [userId],
        limit: 1,
      );
      
      if (existingTransactions.isNotEmpty) {
        print('Sample data already exists for user: $uid. Skipping insertion.');
        return;
      }

      // Add default categories
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Food & Dining',
          'type': 'expense',
          'icon': 'restaurant',
          'sort_order': 1,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Transportation',
          'type': 'expense',
          'icon': 'directions_car',
          'sort_order': 2,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Shopping',
          'type': 'expense',
          'icon': 'shopping_bag',
          'sort_order': 3,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Entertainment',
          'type': 'expense',
          'icon': 'movie',
          'sort_order': 4,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Salary',
          'type': 'income',
          'icon': 'work',
          'sort_order': 1,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'categories',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Freelance',
          'type': 'income',
          'icon': 'laptop',
          'sort_order': 2,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );

      // Add default accounts
      await _db.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Cash Wallet',
          'type': 'CASH',
          'currency': 'USD',
          'is_archived': 0,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Bank Account',
          'type': 'BANK',
          'currency': 'USD',
          'is_archived': 0,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      
      await _db.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Credit Card',
          'type': 'CARD',
          'currency': 'USD',
          'is_archived': 0,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );

      // Get the category IDs for transactions
      final categories = await _db.query(
        'categories',
        where: 'user_id = ?',
        whereArgs: [userId],
        columns: ['category_id', 'name'],
      );
      
      // Get the account IDs for transactions
      final accounts = await _db.query(
        'accounts',
        where: 'user_id = ?',
        whereArgs: [userId],
        columns: ['account_id', 'name'],
      );
      
      // Find specific category and account IDs
      int? foodCategoryId, transportCategoryId, salaryCategoryId;
      int? cashAccountId, bankAccountId;
      
      for (final category in categories) {
        final name = category['name'] as String;
        final id = category['category_id'] as int;
        if (name == 'Food & Dining') foodCategoryId = id;
        if (name == 'Transportation') transportCategoryId = id;
        if (name == 'Salary') salaryCategoryId = id;
      }
      
      for (final account in accounts) {
        final name = account['name'] as String;
        final id = account['account_id'] as int;
        if (name == 'Cash Wallet') cashAccountId = id;
        if (name == 'Bank Account') bankAccountId = id;
      }

      // Add sample transactions
      if (cashAccountId != null && foodCategoryId != null) {
        await _db.insert(
          'transactions',
          {
            'user_id': userId,
            'uid': uid,
            'account_id': cashAccountId,
            'type': 'expense',
            'amount': -25.50,
            'currency': 'USD',
            'category_id': foodCategoryId,
            'note': 'Weekly groceries',
            'occurred_on': '2025-08-10',
            'occurred_at': '2025-08-10 10:00:00',
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      
      if (cashAccountId != null && transportCategoryId != null) {
        await _db.insert(
          'transactions',
          {
            'user_id': userId,
            'uid': uid,
            'account_id': cashAccountId,
            'type': 'expense',
            'amount': -45.00,
            'currency': 'USD',
            'category_id': transportCategoryId,
            'note': 'Gas fill up',
            'occurred_on': '2025-08-12',
            'occurred_at': '2025-08-12 14:30:00',
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      
      if (bankAccountId != null && salaryCategoryId != null) {
        await _db.insert(
          'transactions',
          {
            'user_id': userId,
            'uid': uid,
            'account_id': bankAccountId,
            'type': 'income',
            'amount': 2500.00,
            'currency': 'USD',
            'category_id': salaryCategoryId,
            'note': 'Monthly salary',
            'occurred_on': '2025-08-01',
            'occurred_at': '2025-08-01 09:00:00',
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }

      print('Sample data added successfully for user: $uid (user_id: $userId)');
    } catch (e) {
      print('Failed to add sample data: $e');
      rethrow;
    }
  }

  /// Gets the current database version from app_meta table
  Future<String?> getDatabaseVersion() async {
    try {
      final result = await _db.query(
        'app_meta',
        where: 'key = ?',
        whereArgs: ['db_version'],
        columns: ['value'],
      );
      
      if (result.isNotEmpty) {
        return result.first['value'] as String?;
      }
      return null;
    } catch (e) {
      print('Failed to get database version: $e');
      return null;
    }
  }

  /// Checks if the database needs to be upgraded
  Future<bool> needsUpgrade() async {
    final currentVersion = await getDatabaseVersion();
    if (currentVersion == null) return true;
    
    final version = int.tryParse(currentVersion);
    return version == null || version < 1;
  }

  /// Deletes the database file and closes the connection
  /// WARNING: This will delete all data!
  Future<void> deleteDatabase() async {
    try {
      await _db.close();
      final path = _db.path;
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
        print('Database file deleted: $path');
      }
    } catch (e) {
      print('Failed to delete database: $e');
      rethrow;
    }
  }

  /// Debug method to check what data exists in the database for a user
  Future<void> debugUserData(String uid) async {
    try {
      print('=== DEBUG: Database contents for user $uid ===');
      
      // Check users table
      final users = await _db.query('users', where: 'uid = ?', whereArgs: [uid]);
      print('Users: ${users.length}');
      for (final user in users) {
        print('  User: ${user}');
      }
      
      // Check categories table
      final categories = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
      print('Categories: ${categories.length}');
      for (final category in categories) {
        print('  Category: ${category}');
      }
      
      // Check accounts table
      final accounts = await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
      print('Accounts: ${accounts.length}');
      for (final account in accounts) {
        print('  Account: ${account}');
      }
      
      // Check transactions table
      final transactions = await _db.query('transactions', where: 'uid = ?', whereArgs: [uid]);
      print('Transactions: ${transactions.length}');
      for (final transaction in transactions) {
        print('  Transaction: ${transaction}');
      }
      
      // Also check by user_id
      if (users.isNotEmpty) {
        final userId = users.first['user_id'] as int;
        print('\n=== Checking by user_id: $userId ===');
        
        final categoriesByUserId = await _db.query('categories', where: 'user_id = ?', whereArgs: [userId]);
        print('Categories by user_id: ${categoriesByUserId.length}');
        
        final accountsByUserId = await _db.query('accounts', where: 'user_id = ?', whereArgs: [userId]);
        print('Accounts by user_id: ${accountsByUserId.length}');
        
        final transactionsByUserId = await _db.query('transactions', where: 'user_id = ?', whereArgs: [userId]);
        print('Transactions by user_id: ${transactionsByUserId.length}');
      }
      
      print('=== END DEBUG ===');
    } catch (e) {
      print('Debug failed: $e');
    }
  }

  /// Cleans up existing sample data for a user
  Future<void> cleanupSampleData(String uid) async {
    try {
      // First, get the user_id for this uid
      final userResult = await _db.query(
        'users',
        where: 'uid = ?',
        whereArgs: [uid],
        columns: ['user_id'],
      );
      
      if (userResult.isEmpty) {
        throw Exception('User not found with uid: $uid');
      }
      
      final userId = userResult.first['user_id'] as int;
      print('Cleaning up sample data for user_id: $userId');

      // Delete existing transactions
      final deletedTransactions = await _db.delete(
        'transactions',
        where: 'user_id = ?',
        whereArgs: [userId],
      );
      print('Deleted $deletedTransactions transactions');

      // Delete existing accounts (keep only the first set)
      final accounts = await _db.query(
        'accounts',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'account_id ASC',
      );
      
      if (accounts.length > 3) {
        // Keep only the first 3 accounts, delete the rest
        final accountsToDelete = accounts.skip(3).map((a) => a['account_id'] as int).toList();
        for (final accountId in accountsToDelete) {
          await _db.delete(
            'accounts',
            where: 'account_id = ?',
            whereArgs: [accountId],
          );
        }
        print('Deleted ${accountsToDelete.length} duplicate accounts');
      }

      // Delete existing categories (keep only the first set)
      final categories = await _db.query(
        'categories',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'category_id ASC',
      );
      
      if (categories.length > 6) {
        // Keep only the first 6 categories, delete the rest
        final categoriesToDelete = categories.skip(6).map((c) => c['category_id'] as int).toList();
        for (final categoryId in categoriesToDelete) {
          await _db.delete(
            'categories',
            where: 'category_id = ?',
            whereArgs: [categoryId],
          );
        }
        print('Deleted ${categoriesToDelete.length} duplicate categories');
      }

      print('Sample data cleanup completed for user: $uid');
    } catch (e) {
      print('Failed to cleanup sample data: $e');
      rethrow;
    }
  }
}
