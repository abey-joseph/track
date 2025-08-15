// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @JsonKey(name: 'transaction_id')
  int? get transactionId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  TransactionTypeModel get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payee_id')
  int? get payeeId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'occurred_on')
  DateTime get occurredOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'occurred_at')
  DateTime? get occurredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_group_id')
  String? get transferGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_split')
  bool get hasSplit => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') int? transactionId,
      String uid,
      @JsonKey(name: 'account_id') int accountId,
      TransactionTypeModel type,
      double amount,
      String currency,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'payee_id') int? payeeId,
      String? note,
      @JsonKey(name: 'occurred_on') DateTime occurredOn,
      @JsonKey(name: 'occurred_at') DateTime? occurredAt,
      @JsonKey(name: 'transfer_group_id') String? transferGroupId,
      @JsonKey(name: 'has_split') bool hasSplit,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? uid = null,
    Object? accountId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? categoryId = freezed,
    Object? payeeId = freezed,
    Object? note = freezed,
    Object? occurredOn = null,
    Object? occurredAt = freezed,
    Object? transferGroupId = freezed,
    Object? hasSplit = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      payeeId: freezed == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredOn: null == occurredOn
          ? _value.occurredOn
          : occurredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAt: freezed == occurredAt
          ? _value.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferGroupId: freezed == transferGroupId
          ? _value.transferGroupId
          : transferGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSplit: null == hasSplit
          ? _value.hasSplit
          : hasSplit // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') int? transactionId,
      String uid,
      @JsonKey(name: 'account_id') int accountId,
      TransactionTypeModel type,
      double amount,
      String currency,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'payee_id') int? payeeId,
      String? note,
      @JsonKey(name: 'occurred_on') DateTime occurredOn,
      @JsonKey(name: 'occurred_at') DateTime? occurredAt,
      @JsonKey(name: 'transfer_group_id') String? transferGroupId,
      @JsonKey(name: 'has_split') bool hasSplit,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? uid = null,
    Object? accountId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? categoryId = freezed,
    Object? payeeId = freezed,
    Object? note = freezed,
    Object? occurredOn = null,
    Object? occurredAt = freezed,
    Object? transferGroupId = freezed,
    Object? hasSplit = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransactionModelImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      payeeId: freezed == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredOn: null == occurredOn
          ? _value.occurredOn
          : occurredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      occurredAt: freezed == occurredAt
          ? _value.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferGroupId: freezed == transferGroupId
          ? _value.transferGroupId
          : transferGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSplit: null == hasSplit
          ? _value.hasSplit
          : hasSplit // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {@JsonKey(name: 'transaction_id') this.transactionId,
      required this.uid,
      @JsonKey(name: 'account_id') required this.accountId,
      required this.type,
      required this.amount,
      required this.currency,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'payee_id') this.payeeId,
      this.note,
      @JsonKey(name: 'occurred_on') required this.occurredOn,
      @JsonKey(name: 'occurred_at') this.occurredAt,
      @JsonKey(name: 'transfer_group_id') this.transferGroupId,
      @JsonKey(name: 'has_split') this.hasSplit = false,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final int? transactionId;
  @override
  final String uid;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  final TransactionTypeModel type;
  @override
  final double amount;
  @override
  final String currency;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'payee_id')
  final int? payeeId;
  @override
  final String? note;
  @override
  @JsonKey(name: 'occurred_on')
  final DateTime occurredOn;
  @override
  @JsonKey(name: 'occurred_at')
  final DateTime? occurredAt;
  @override
  @JsonKey(name: 'transfer_group_id')
  final String? transferGroupId;
  @override
  @JsonKey(name: 'has_split')
  final bool hasSplit;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TransactionModel(transactionId: $transactionId, uid: $uid, accountId: $accountId, type: $type, amount: $amount, currency: $currency, categoryId: $categoryId, payeeId: $payeeId, note: $note, occurredOn: $occurredOn, occurredAt: $occurredAt, transferGroupId: $transferGroupId, hasSplit: $hasSplit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.occurredOn, occurredOn) ||
                other.occurredOn == occurredOn) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.transferGroupId, transferGroupId) ||
                other.transferGroupId == transferGroupId) &&
            (identical(other.hasSplit, hasSplit) ||
                other.hasSplit == hasSplit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      uid,
      accountId,
      type,
      amount,
      currency,
      categoryId,
      payeeId,
      note,
      occurredOn,
      occurredAt,
      transferGroupId,
      hasSplit,
      createdAt,
      updatedAt);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
          {@JsonKey(name: 'transaction_id') final int? transactionId,
          required final String uid,
          @JsonKey(name: 'account_id') required final int accountId,
          required final TransactionTypeModel type,
          required final double amount,
          required final String currency,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'payee_id') final int? payeeId,
          final String? note,
          @JsonKey(name: 'occurred_on') required final DateTime occurredOn,
          @JsonKey(name: 'occurred_at') final DateTime? occurredAt,
          @JsonKey(name: 'transfer_group_id') final String? transferGroupId,
          @JsonKey(name: 'has_split') final bool hasSplit,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  int? get transactionId;
  @override
  String get uid;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  TransactionTypeModel get type;
  @override
  double get amount;
  @override
  String get currency;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'payee_id')
  int? get payeeId;
  @override
  String? get note;
  @override
  @JsonKey(name: 'occurred_on')
  DateTime get occurredOn;
  @override
  @JsonKey(name: 'occurred_at')
  DateTime? get occurredAt;
  @override
  @JsonKey(name: 'transfer_group_id')
  String? get transferGroupId;
  @override
  @JsonKey(name: 'has_split')
  bool get hasSplit;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
