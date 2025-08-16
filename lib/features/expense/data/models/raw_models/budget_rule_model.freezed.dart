// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetRuleModel _$BudgetRuleModelFromJson(Map<String, dynamic> json) {
  return _BudgetRuleModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetRuleModel {
  @JsonKey(name: 'rule_id')
  int? get ruleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_id')
  int get budgetId => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get include => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int? get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_id')
  int? get tagId => throw _privateConstructorUsedError;

  /// Serializes this BudgetRuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetRuleModelCopyWith<BudgetRuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetRuleModelCopyWith<$Res> {
  factory $BudgetRuleModelCopyWith(
          BudgetRuleModel value, $Res Function(BudgetRuleModel) then) =
      _$BudgetRuleModelCopyWithImpl<$Res, BudgetRuleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rule_id') int? ruleId,
      @JsonKey(name: 'budget_id') int budgetId,
      @BoolConverter() bool include,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'account_id') int? accountId,
      @JsonKey(name: 'tag_id') int? tagId});
}

/// @nodoc
class _$BudgetRuleModelCopyWithImpl<$Res, $Val extends BudgetRuleModel>
    implements $BudgetRuleModelCopyWith<$Res> {
  _$BudgetRuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = freezed,
    Object? budgetId = null,
    Object? include = null,
    Object? categoryId = freezed,
    Object? accountId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_value.copyWith(
      ruleId: freezed == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as int?,
      budgetId: null == budgetId
          ? _value.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as int,
      include: null == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetRuleModelImplCopyWith<$Res>
    implements $BudgetRuleModelCopyWith<$Res> {
  factory _$$BudgetRuleModelImplCopyWith(_$BudgetRuleModelImpl value,
          $Res Function(_$BudgetRuleModelImpl) then) =
      __$$BudgetRuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rule_id') int? ruleId,
      @JsonKey(name: 'budget_id') int budgetId,
      @BoolConverter() bool include,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'account_id') int? accountId,
      @JsonKey(name: 'tag_id') int? tagId});
}

/// @nodoc
class __$$BudgetRuleModelImplCopyWithImpl<$Res>
    extends _$BudgetRuleModelCopyWithImpl<$Res, _$BudgetRuleModelImpl>
    implements _$$BudgetRuleModelImplCopyWith<$Res> {
  __$$BudgetRuleModelImplCopyWithImpl(
      _$BudgetRuleModelImpl _value, $Res Function(_$BudgetRuleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = freezed,
    Object? budgetId = null,
    Object? include = null,
    Object? categoryId = freezed,
    Object? accountId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_$BudgetRuleModelImpl(
      ruleId: freezed == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as int?,
      budgetId: null == budgetId
          ? _value.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as int,
      include: null == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetRuleModelImpl implements _BudgetRuleModel {
  const _$BudgetRuleModelImpl(
      {@JsonKey(name: 'rule_id') this.ruleId,
      @JsonKey(name: 'budget_id') required this.budgetId,
      @BoolConverter() this.include = true,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'account_id') this.accountId,
      @JsonKey(name: 'tag_id') this.tagId});

  factory _$BudgetRuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetRuleModelImplFromJson(json);

  @override
  @JsonKey(name: 'rule_id')
  final int? ruleId;
  @override
  @JsonKey(name: 'budget_id')
  final int budgetId;
  @override
  @JsonKey()
  @BoolConverter()
  final bool include;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'account_id')
  final int? accountId;
  @override
  @JsonKey(name: 'tag_id')
  final int? tagId;

  @override
  String toString() {
    return 'BudgetRuleModel(ruleId: $ruleId, budgetId: $budgetId, include: $include, categoryId: $categoryId, accountId: $accountId, tagId: $tagId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetRuleModelImpl &&
            (identical(other.ruleId, ruleId) || other.ruleId == ruleId) &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId) &&
            (identical(other.include, include) || other.include == include) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, ruleId, budgetId, include, categoryId, accountId, tagId);

  /// Create a copy of BudgetRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetRuleModelImplCopyWith<_$BudgetRuleModelImpl> get copyWith =>
      __$$BudgetRuleModelImplCopyWithImpl<_$BudgetRuleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetRuleModelImplToJson(
      this,
    );
  }
}

abstract class _BudgetRuleModel implements BudgetRuleModel {
  const factory _BudgetRuleModel(
      {@JsonKey(name: 'rule_id') final int? ruleId,
      @JsonKey(name: 'budget_id') required final int budgetId,
      @BoolConverter() final bool include,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'account_id') final int? accountId,
      @JsonKey(name: 'tag_id') final int? tagId}) = _$BudgetRuleModelImpl;

  factory _BudgetRuleModel.fromJson(Map<String, dynamic> json) =
      _$BudgetRuleModelImpl.fromJson;

  @override
  @JsonKey(name: 'rule_id')
  int? get ruleId;
  @override
  @JsonKey(name: 'budget_id')
  int get budgetId;
  @override
  @BoolConverter()
  bool get include;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'account_id')
  int? get accountId;
  @override
  @JsonKey(name: 'tag_id')
  int? get tagId;

  /// Create a copy of BudgetRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetRuleModelImplCopyWith<_$BudgetRuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
