class PayeeEntity {
  final int? payeeId;
  final String uid;
  final String name;
  final String? normalized;

  const PayeeEntity({
    this.payeeId,
    required this.uid,
    required this.name,
    this.normalized,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PayeeEntity &&
        other.payeeId == payeeId &&
        other.uid == uid &&
        other.name == name &&
        other.normalized == normalized;
  }

  @override
  int get hashCode {
    return payeeId.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        normalized.hashCode;
  }

  PayeeEntity copyWith({
    int? payeeId,
    String? uid,
    String? name,
    String? normalized,
  }) {
    return PayeeEntity(
      payeeId: payeeId ?? this.payeeId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      normalized: normalized ?? this.normalized,
    );
  }
}
