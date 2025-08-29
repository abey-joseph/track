import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';

class AccountRepoCalculations {}

class AccountRepoMappers {
  static TransactionEntity fromRow(Map<String, Object?> row) {
    return TransactionEntity(
      transactionId: row['transaction_id'] as int?,
      uid: row['uid'] as String,
      accountId: row['account_id'] as int,
      type: parseTransactionType(row['type'] as String),
      amount: _minorToDisplay(row['amount_minor'],
          currency: row['currency'] as String),
      currency: row['currency'] as String,
      categoryId: row['category_id'] as int?,
      payeeId: row['payee_id'] as int?,
      note: row['note'] as String?,
      occurredOn: DateTime.parse(row['occurred_on'] as String),
      occurredAt: row['occurred_at'] != null
          ? DateTime.parse(row['occurred_at'] as String)
          : null,
      transferGroupId: row['transfer_group_id'] as String?,
      hasSplit: (row['has_split'] as int?) == 1,
      createdAt: DateTime.parse(row['created_at'] as String),
      updatedAt: row['updated_at'] != null
          ? DateTime.parse(row['updated_at'] as String)
          : null,
    );
  }

  static TransactionType parseTransactionType(String type) {
    switch (type.toUpperCase()) {
      case 'INCOME':
        return TransactionType.income;
      case 'EXPENSE':
        return TransactionType.expense;
      case 'TRANSFER':
        return TransactionType.transfer;
      default:
        return TransactionType.expense;
    }
  }

  static double _minorToDisplay(Object? minorValue,
      {required String currency}) {
    final minor = (minorValue is int)
        ? minorValue
        : (minorValue is num)
            ? minorValue.toInt()
            : int.tryParse(minorValue?.toString() ?? '0') ?? 0;
    final minorFactor = _getMinorFactor(currency);
    return minor / minorFactor;
  }

  static int _getMinorFactor(String currency) {
    switch (currency.toUpperCase()) {
      case 'JPY':
        return 1;
      case 'KWD':
        return 1000;
      default:
        return 100;
    }
  }
}
