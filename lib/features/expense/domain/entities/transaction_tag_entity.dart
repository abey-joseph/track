class TransactionTagEntity {
  final int transactionId;
  final int tagId;

  const TransactionTagEntity({
    required this.transactionId,
    required this.tagId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionTagEntity &&
        other.transactionId == transactionId &&
        other.tagId == tagId;
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^ tagId.hashCode;
  }

  TransactionTagEntity copyWith({
    int? transactionId,
    int? tagId,
  }) {
    return TransactionTagEntity(
      transactionId: transactionId ?? this.transactionId,
      tagId: tagId ?? this.tagId,
    );
  }
}
