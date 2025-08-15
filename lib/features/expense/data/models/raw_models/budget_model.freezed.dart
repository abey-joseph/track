// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
  @JsonKey(name: 'budget_id')
  int? get budgetId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_type')
  BudgetPeriodTypeModel get periodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_on')
  DateTime get startOn => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_transfers')
  bool get includeTransfers => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
          BudgetModel value, $Res Function(BudgetModel) then) =
      _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'budget_id') int? budgetId,
      String uid,
      String name,
      String currency,
      @JsonKey(name: 'period_type') BudgetPeriodTypeModel periodType,
      @JsonKey(name: 'start_on') DateTime startOn,
      double amount,
      @JsonKey(name: 'include_transfers') bool includeTransfers,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetId = freezed,
    Object? uid = null,
    Object? name = null,
    Object? currency = null,
    Object? periodType = null,
    Object? startOn = null,
    Object? amount = null,
    Object? includeTransfers = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      budgetId: freezed == budgetId
          ? _value.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      periodType: null == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as BudgetPeriodTypeModel,
      startOn: null == startOn
          ? _value.startOn
          : startOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      includeTransfers: null == includeTransfers
          ? _value.includeTransfers
          : includeTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
          _$BudgetModelImpl value, $Res Function(_$BudgetModelImpl) then) =
      __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'budget_id') int? budgetId,
      String uid,
      String name,
      String currency,
      @JsonKey(name: 'period_type') BudgetPeriodTypeModel periodType,
      @JsonKey(name: 'start_on') DateTime startOn,
      double amount,
      @JsonKey(name: 'include_transfers') bool includeTransfers,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
      _$BudgetModelImpl _value, $Res Function(_$BudgetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetId = freezed,
    Object? uid = null,
    Object? name = null,
    Object? currency = null,
    Object? periodType = null,
    Object? startOn = null,
    Object? amount = null,
    Object? includeTransfers = null,
    Object? createdAt = null,
  }) {
    return _then(_$BudgetModelImpl(
      budgetId: freezed == budgetId
          ? _value.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      periodType: null == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as BudgetPeriodTypeModel,
      startOn: null == startOn
          ? _value.startOn
          : startOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      includeTransfers: null == includeTransfers
          ? _value.includeTransfers
          : includeTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl(
      {@JsonKey(name: 'budget_id') this.budgetId,
      required this.uid,
      required this.name,
      required this.currency,
      @JsonKey(name: 'period_type') required this.periodType,
      @JsonKey(name: 'start_on') required this.startOn,
      required this.amount,
      @JsonKey(name: 'include_transfers') this.includeTransfers = false,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

  @override
  @JsonKey(name: 'budget_id')
  final int? budgetId;
  @override
  final String uid;
  @override
  final String name;
  @override
  final String currency;
  @override
  @JsonKey(name: 'period_type')
  final BudgetPeriodTypeModel periodType;
  @override
  @JsonKey(name: 'start_on')
  final DateTime startOn;
  @override
  final double amount;
  @override
  @JsonKey(name: 'include_transfers')
  final bool includeTransfers;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'BudgetModel(budgetId: $budgetId, uid: $uid, name: $name, currency: $currency, periodType: $periodType, startOn: $startOn, amount: $amount, includeTransfers: $includeTransfers, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.periodType, periodType) ||
                other.periodType == periodType) &&
            (identical(other.startOn, startOn) || other.startOn == startOn) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.includeTransfers, includeTransfers) ||
                other.includeTransfers == includeTransfers) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, budgetId, uid, name, currency,
      periodType, startOn, amount, includeTransfers, createdAt);

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(
      this,
    );
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel(
          {@JsonKey(name: 'budget_id') final int? budgetId,
          required final String uid,
          required final String name,
          required final String currency,
          @JsonKey(name: 'period_type')
          required final BudgetPeriodTypeModel periodType,
          @JsonKey(name: 'start_on') required final DateTime startOn,
          required final double amount,
          @JsonKey(name: 'include_transfers') final bool includeTransfers,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

  @override
  @JsonKey(name: 'budget_id')
  int? get budgetId;
  @override
  String get uid;
  @override
  String get name;
  @override
  String get currency;
  @override
  @JsonKey(name: 'period_type')
  BudgetPeriodTypeModel get periodType;
  @override
  @JsonKey(name: 'start_on')
  DateTime get startOn;
  @override
  double get amount;
  @override
  @JsonKey(name: 'include_transfers')
  bool get includeTransfers;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
