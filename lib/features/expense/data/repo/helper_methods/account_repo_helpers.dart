import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';

class AccountRepoCalculations {}

class AccountRepoMappers {
  static TransactionEntity fromRow(Map<String, Object?> row) {
    return TransactionEntity(
      transactionId: row['transaction_id'] as int?,
      uid: row['uid'] as String,
      accountId: row['account_id'] as int,
      type: parseTransactionType(row['type'] as String),
      amount: (row['amount'] as num).toDouble(),
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
}
