class UserEntity {
  final String uid;
  final String? name;
  final DateTime createdAt;

  const UserEntity({
    required this.uid,
    this.name,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity &&
        other.uid == uid &&
        other.name == name &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ createdAt.hashCode;
  }

  UserEntity copyWith({
    String? uid,
    String? name,
    DateTime? createdAt,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
