enum CategoryType { expense, income }

class CategoryEntity {
  final int? categoryId;
  final String uid;
  final String name;
  final CategoryType type;
  final int? parentId;
  final String? icon;
  final int sortOrder;

  const CategoryEntity({
    this.categoryId,
    required this.uid,
    required this.name,
    required this.type,
    this.parentId,
    this.icon,
    this.sortOrder = 0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryEntity &&
        other.categoryId == categoryId &&
        other.uid == uid &&
        other.name == name &&
        other.type == type &&
        other.parentId == parentId &&
        other.icon == icon &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        type.hashCode ^
        parentId.hashCode ^
        icon.hashCode ^
        sortOrder.hashCode;
  }

  CategoryEntity copyWith({
    int? categoryId,
    String? uid,
    String? name,
    CategoryType? type,
    int? parentId,
    String? icon,
    int? sortOrder,
  }) {
    return CategoryEntity(
      categoryId: categoryId ?? this.categoryId,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      type: type ?? this.type,
      parentId: parentId ?? this.parentId,
      icon: icon ?? this.icon,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
