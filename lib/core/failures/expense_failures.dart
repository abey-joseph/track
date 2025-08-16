import 'failure.dart';

/// Domain-specific failures for expense tracking application

/// Failure when trying to perform operations on an account
class AccountFailure extends Failure {
  final String? accountId;
  final String? accountName;
  
  const AccountFailure(
    super.message, {
    this.accountId,
    this.accountName,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/account/error',
        );
}

/// Failure when trying to perform operations on a category
class CategoryFailure extends Failure {
  final String? categoryId;
  final String? categoryName;
  final String? categoryType;
  
  const CategoryFailure(
    super.message, {
    this.categoryId,
    this.categoryName,
    this.categoryType,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/category/error',
        );
}

/// Failure when trying to perform operations on transactions
class TransactionFailure extends Failure {
  final String? transactionId;
  final String? accountId;
  final String? categoryId;
  final double? amount;
  
  const TransactionFailure(
    super.message, {
    this.transactionId,
    this.accountId,
    this.categoryId,
    this.amount,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/transaction/error',
        );
}

/// Failure when budget limits are exceeded
class BudgetFailure extends Failure {
  final String? budgetId;
  final String? categoryId;
  final double? limit;
  final double? current;
  final double? exceeded;
  
  const BudgetFailure(
    super.message, {
    this.budgetId,
    this.categoryId,
    this.limit,
    this.current,
    this.exceeded,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/budget/error',
        );
}

/// Failure when currency conversion fails
class CurrencyFailure extends Failure {
  final String? fromCurrency;
  final String? toCurrency;
  final double? amount;
  
  const CurrencyFailure(
    super.message, {
    this.fromCurrency,
    this.toCurrency,
    this.amount,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/currency/error',
        );
}

/// Failure when data import/export operations fail
class DataOperationFailure extends Failure {
  final String? operation; // 'import' or 'export'
  final String? filePath;
  final String? format; // 'csv', 'json', etc.
  
  const DataOperationFailure(
    super.message, {
    this.operation,
    this.filePath,
    this.format,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/data_operation/error',
        );
}

/// Failure when backup/restore operations fail
class BackupFailure extends Failure {
  final String? operation; // 'backup' or 'restore'
  final String? backupPath;
  final DateTime? backupDate;
  
  const BackupFailure(
    super.message, {
    this.operation,
    this.backupPath,
    this.backupDate,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/backup/error',
        );
}

/// Failure when synchronization operations fail
class SyncFailure extends Failure {
  final String? syncType; // 'cloud', 'local', etc.
  final String? deviceId;
  final DateTime? lastSync;
  
  const SyncFailure(
    super.message, {
    this.syncType,
    this.deviceId,
    this.lastSync,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/sync/error',
        );
}

/// Failure when reporting/analytics operations fail
class ReportFailure extends Failure {
  final String? reportType; // 'monthly', 'yearly', 'category', etc.
  final DateTime? startDate;
  final DateTime? endDate;
  
  const ReportFailure(
    super.message, {
    this.reportType,
    this.startDate,
    this.endDate,
    String? code,
    super.cause,
    super.stackTrace,
  }) : super(
          code: code ?? 'expense/report/error',
        );
}
