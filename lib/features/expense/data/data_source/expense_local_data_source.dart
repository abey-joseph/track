import 'package:track/features/expense/data/models/raw_models/transaction_model.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/data/models/raw_models/category_model.dart';
import 'package:track/features/expense/data/models/raw_models/payee_model.dart';

abstract class ExpenseLocalDataSource {
  // Transaction operations
  Future<List<TransactionModel>> getRecentTransactions({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  });

  Future<int> getTransactionCountInPeriod({
    required String uid,
    required int dayCount,
  });

  Future<List<TransactionModel>> getTodayTransactions({
    required String uid,
    int limit = 10,
  });

  Future<TransactionModel> createTransaction(TransactionModel transaction);

  Future<TransactionModel> updateTransaction(TransactionModel transaction);

  Future<void> deleteTransaction(int transactionId);

  // Account operations
  Future<List<AccountModel>> getAccounts(String uid);
  
  Future<AccountModel> getAccountById(int accountId);

  // Category operations
  Future<List<CategoryModel>> getCategories(String uid);

  // Payee operations
  Future<List<PayeeModel>> getPayees(String uid);
}
