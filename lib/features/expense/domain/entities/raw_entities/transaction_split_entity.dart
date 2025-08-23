class TransactionSplitEntity {
  final int? splitId;
  final int transactionId;
  final int categoryId;
  final double amount;
  final String? note;

  const TransactionSplitEntity({
    this.splitId,
    required this.transactionId,
    required this.categoryId,
    required this.amount,
    this.note,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionSplitEntity &&
        other.splitId == splitId &&
        other.transactionId == transactionId &&
        other.categoryId == categoryId &&
        other.amount == amount &&
        other.note == note;
  }

  @override
  int get hashCode {
    return splitId.hashCode ^
        transactionId.hashCode ^
        categoryId.hashCode ^
        amount.hashCode ^
        note.hashCode;
  }

  TransactionSplitEntity copyWith({
    int? splitId,
    int? transactionId,
    int? categoryId,
    double? amount,
    String? note,
  }) {
    return TransactionSplitEntity(
      splitId: splitId ?? this.splitId,
      transactionId: transactionId ?? this.transactionId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
    );
  }
}
