
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';


abstract class ExpenseRepository {
  // Accounts
  Future<List<AccountEntity>> getAccounts({required String uid});
  Future<void> addAccount({required AccountEntity account});
  Future<void> updateAccount({required AccountEntity account});

  // Categories
  Future<List<CategoryEntity>> getCategories({required String uid});
  Future<void> addCategory({required CategoryEntity category});
  Future<void> updateCategory({required CategoryEntity category});

  // Transactions
  Future<List<TransactionEntity>> getTransactions({
    required String uid,
    DateTime? from,
    DateTime? to,
  });
  Future<void> addTransaction({required TransactionEntity transaction});
  Future<void> updateTransaction({required TransactionEntity transaction});
}


