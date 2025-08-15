enum AccountType { cash, bank, card, ewallet, other }

class AccountEntity {
  final int? accountId;
  final String uid;
  final String name;
  final AccountType type;
  final String currency;
  final bool isArchived;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const AccountEntity({
    this.accountId,
    required this.uid,
    required this.name,
    required this.type,
    required this.currency,
    this.isArchived = false,
    this.isDefault = false,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountEntity &&
        other.accountId == accountId &&
        other.uid == uid &&
        other.name == name &&
        other.type == type &&
        other.currency == currency &&
        other.isArchived == isArchived &&
        other.isDefault == isDefault &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        type.hashCode ^
        currency.hashCode ^
        isArchived.hashCode ^
        isDefault.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  AccountEntity copyWith({
    int? accountId,
    String? uid,
    String? name,
    AccountType? type,
    String? currency,
    bool? isArchived,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AccountEntity(
      accountId: accountId ?? this.accountId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      isArchived: isArchived ?? this.isArchived,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
