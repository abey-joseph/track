class TagEntity {
  final int? tagId;
  final String uid;
  final String name;

  const TagEntity({
    this.tagId,
    required this.uid,
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TagEntity &&
        other.tagId == tagId &&
        other.uid == uid &&
        other.name == name;
  }

  @override
  int get hashCode {
    return tagId.hashCode ^ uid.hashCode ^ name.hashCode;
  }

  TagEntity copyWith({
    int? tagId,
    String? uid,
    String? name,
  }) {
    return TagEntity(
      tagId: tagId ?? this.tagId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }
}
