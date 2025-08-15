// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_split_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionSplitModel _$TransactionSplitModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionSplitModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionSplitModel {
  @JsonKey(name: 'split_id')
  int? get splitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this TransactionSplitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSplitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSplitModelCopyWith<TransactionSplitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSplitModelCopyWith<$Res> {
  factory $TransactionSplitModelCopyWith(TransactionSplitModel value,
          $Res Function(TransactionSplitModel) then) =
      _$TransactionSplitModelCopyWithImpl<$Res, TransactionSplitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'split_id') int? splitId,
      @JsonKey(name: 'transaction_id') int transactionId,
      @JsonKey(name: 'category_id') int categoryId,
      double amount,
      String? note});
}

/// @nodoc
class _$TransactionSplitModelCopyWithImpl<$Res,
        $Val extends TransactionSplitModel>
    implements $TransactionSplitModelCopyWith<$Res> {
  _$TransactionSplitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSplitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitId = freezed,
    Object? transactionId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      splitId: freezed == splitId
          ? _value.splitId
          : splitId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSplitModelImplCopyWith<$Res>
    implements $TransactionSplitModelCopyWith<$Res> {
  factory _$$TransactionSplitModelImplCopyWith(
          _$TransactionSplitModelImpl value,
          $Res Function(_$TransactionSplitModelImpl) then) =
      __$$TransactionSplitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'split_id') int? splitId,
      @JsonKey(name: 'transaction_id') int transactionId,
      @JsonKey(name: 'category_id') int categoryId,
      double amount,
      String? note});
}

/// @nodoc
class __$$TransactionSplitModelImplCopyWithImpl<$Res>
    extends _$TransactionSplitModelCopyWithImpl<$Res,
        _$TransactionSplitModelImpl>
    implements _$$TransactionSplitModelImplCopyWith<$Res> {
  __$$TransactionSplitModelImplCopyWithImpl(_$TransactionSplitModelImpl _value,
      $Res Function(_$TransactionSplitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSplitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitId = freezed,
    Object? transactionId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? note = freezed,
  }) {
    return _then(_$TransactionSplitModelImpl(
      splitId: freezed == splitId
          ? _value.splitId
          : splitId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSplitModelImpl implements _TransactionSplitModel {
  const _$TransactionSplitModelImpl(
      {@JsonKey(name: 'split_id') this.splitId,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.amount,
      this.note});

  factory _$TransactionSplitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSplitModelImplFromJson(json);

  @override
  @JsonKey(name: 'split_id')
  final int? splitId;
  @override
  @JsonKey(name: 'transaction_id')
  final int transactionId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final double amount;
  @override
  final String? note;

  @override
  String toString() {
    return 'TransactionSplitModel(splitId: $splitId, transactionId: $transactionId, categoryId: $categoryId, amount: $amount, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSplitModelImpl &&
            (identical(other.splitId, splitId) || other.splitId == splitId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, splitId, transactionId, categoryId, amount, note);

  /// Create a copy of TransactionSplitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSplitModelImplCopyWith<_$TransactionSplitModelImpl>
      get copyWith => __$$TransactionSplitModelImplCopyWithImpl<
          _$TransactionSplitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSplitModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionSplitModel implements TransactionSplitModel {
  const factory _TransactionSplitModel(
      {@JsonKey(name: 'split_id') final int? splitId,
      @JsonKey(name: 'transaction_id') required final int transactionId,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final double amount,
      final String? note}) = _$TransactionSplitModelImpl;

  factory _TransactionSplitModel.fromJson(Map<String, dynamic> json) =
      _$TransactionSplitModelImpl.fromJson;

  @override
  @JsonKey(name: 'split_id')
  int? get splitId;
  @override
  @JsonKey(name: 'transaction_id')
  int get transactionId;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  double get amount;
  @override
  String? get note;

  /// Create a copy of TransactionSplitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSplitModelImplCopyWith<_$TransactionSplitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
