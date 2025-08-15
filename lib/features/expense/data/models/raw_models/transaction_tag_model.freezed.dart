// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionTagModel _$TransactionTagModelFromJson(Map<String, dynamic> json) {
  return _TransactionTagModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionTagModel {
  @JsonKey(name: 'transaction_id')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_id')
  int get tagId => throw _privateConstructorUsedError;

  /// Serializes this TransactionTagModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionTagModelCopyWith<TransactionTagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTagModelCopyWith<$Res> {
  factory $TransactionTagModelCopyWith(
          TransactionTagModel value, $Res Function(TransactionTagModel) then) =
      _$TransactionTagModelCopyWithImpl<$Res, TransactionTagModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') int transactionId,
      @JsonKey(name: 'tag_id') int tagId});
}

/// @nodoc
class _$TransactionTagModelCopyWithImpl<$Res, $Val extends TransactionTagModel>
    implements $TransactionTagModelCopyWith<$Res> {
  _$TransactionTagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? tagId = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTagModelImplCopyWith<$Res>
    implements $TransactionTagModelCopyWith<$Res> {
  factory _$$TransactionTagModelImplCopyWith(_$TransactionTagModelImpl value,
          $Res Function(_$TransactionTagModelImpl) then) =
      __$$TransactionTagModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') int transactionId,
      @JsonKey(name: 'tag_id') int tagId});
}

/// @nodoc
class __$$TransactionTagModelImplCopyWithImpl<$Res>
    extends _$TransactionTagModelCopyWithImpl<$Res, _$TransactionTagModelImpl>
    implements _$$TransactionTagModelImplCopyWith<$Res> {
  __$$TransactionTagModelImplCopyWithImpl(_$TransactionTagModelImpl _value,
      $Res Function(_$TransactionTagModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? tagId = null,
  }) {
    return _then(_$TransactionTagModelImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTagModelImpl implements _TransactionTagModel {
  const _$TransactionTagModelImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'tag_id') required this.tagId});

  factory _$TransactionTagModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTagModelImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final int transactionId;
  @override
  @JsonKey(name: 'tag_id')
  final int tagId;

  @override
  String toString() {
    return 'TransactionTagModel(transactionId: $transactionId, tagId: $tagId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTagModelImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, tagId);

  /// Create a copy of TransactionTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTagModelImplCopyWith<_$TransactionTagModelImpl> get copyWith =>
      __$$TransactionTagModelImplCopyWithImpl<_$TransactionTagModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTagModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionTagModel implements TransactionTagModel {
  const factory _TransactionTagModel(
          {@JsonKey(name: 'transaction_id') required final int transactionId,
          @JsonKey(name: 'tag_id') required final int tagId}) =
      _$TransactionTagModelImpl;

  factory _TransactionTagModel.fromJson(Map<String, dynamic> json) =
      _$TransactionTagModelImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  int get transactionId;
  @override
  @JsonKey(name: 'tag_id')
  int get tagId;

  /// Create a copy of TransactionTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionTagModelImplCopyWith<_$TransactionTagModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
