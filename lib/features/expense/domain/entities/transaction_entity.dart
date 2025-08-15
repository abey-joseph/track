enum TransactionType { expense, income, transfer }

class TransactionEntity {
  final int? transactionId;
  final String uid;
  final int accountId;
  final TransactionType type;
  final double amount;
  final String currency;
  final int? categoryId;
  final int? payeeId;
  final String? note;
  final DateTime occurredOn;
  final DateTime? occurredAt;
  final String? transferGroupId;
  final bool hasSplit;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const TransactionEntity({
    this.transactionId,
    required this.uid,
    required this.accountId,
    required this.type,
    required this.amount,
    required this.currency,
    this.categoryId,
    this.payeeId,
    this.note,
    required this.occurredOn,
    this.occurredAt,
    this.transferGroupId,
    this.hasSplit = false,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionEntity &&
        other.transactionId == transactionId &&
        other.uid == uid &&
        other.accountId == accountId &&
        other.type == type &&
        other.amount == amount &&
        other.currency == currency &&
        other.categoryId == categoryId &&
        other.payeeId == payeeId &&
        other.note == note &&
        other.occurredOn == occurredOn &&
        other.occurredAt == occurredAt &&
        other.transferGroupId == transferGroupId &&
        other.hasSplit == hasSplit &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^
        uid.hashCode ^
        accountId.hashCode ^
        type.hashCode ^
        amount.hashCode ^
        currency.hashCode ^
        categoryId.hashCode ^
        payeeId.hashCode ^
        note.hashCode ^
        occurredOn.hashCode ^
        occurredAt.hashCode ^
        transferGroupId.hashCode ^
        hasSplit.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  TransactionEntity copyWith({
    int? transactionId,
    String? uid,
    int? accountId,
    TransactionType? type,
    double? amount,
    String? currency,
    int? categoryId,
    int? payeeId,
    String? note,
    DateTime? occurredOn,
    DateTime? occurredAt,
    String? transferGroupId,
    bool? hasSplit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionEntity(
      transactionId: transactionId ?? this.transactionId,
      uid: uid ?? this.uid,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      categoryId: categoryId ?? this.categoryId,
      payeeId: payeeId ?? this.payeeId,
      note: note ?? this.note,
      occurredOn: occurredOn ?? this.occurredOn,
      occurredAt: occurredAt ?? this.occurredAt,
      transferGroupId: transferGroupId ?? this.transferGroupId,
      hasSplit: hasSplit ?? this.hasSplit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
