// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayeeModel _$PayeeModelFromJson(Map<String, dynamic> json) {
  return _PayeeModel.fromJson(json);
}

/// @nodoc
mixin _$PayeeModel {
  @JsonKey(name: 'payee_id')
  int? get payeeId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get normalized => throw _privateConstructorUsedError;

  /// Serializes this PayeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayeeModelCopyWith<PayeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeModelCopyWith<$Res> {
  factory $PayeeModelCopyWith(
          PayeeModel value, $Res Function(PayeeModel) then) =
      _$PayeeModelCopyWithImpl<$Res, PayeeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payee_id') int? payeeId,
      String uid,
      String name,
      String? normalized});
}

/// @nodoc
class _$PayeeModelCopyWithImpl<$Res, $Val extends PayeeModel>
    implements $PayeeModelCopyWith<$Res> {
  _$PayeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payeeId = freezed,
    Object? uid = null,
    Object? name = null,
    Object? normalized = freezed,
  }) {
    return _then(_value.copyWith(
      payeeId: freezed == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      normalized: freezed == normalized
          ? _value.normalized
          : normalized // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayeeModelImplCopyWith<$Res>
    implements $PayeeModelCopyWith<$Res> {
  factory _$$PayeeModelImplCopyWith(
          _$PayeeModelImpl value, $Res Function(_$PayeeModelImpl) then) =
      __$$PayeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payee_id') int? payeeId,
      String uid,
      String name,
      String? normalized});
}

/// @nodoc
class __$$PayeeModelImplCopyWithImpl<$Res>
    extends _$PayeeModelCopyWithImpl<$Res, _$PayeeModelImpl>
    implements _$$PayeeModelImplCopyWith<$Res> {
  __$$PayeeModelImplCopyWithImpl(
      _$PayeeModelImpl _value, $Res Function(_$PayeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payeeId = freezed,
    Object? uid = null,
    Object? name = null,
    Object? normalized = freezed,
  }) {
    return _then(_$PayeeModelImpl(
      payeeId: freezed == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      normalized: freezed == normalized
          ? _value.normalized
          : normalized // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayeeModelImpl implements _PayeeModel {
  const _$PayeeModelImpl(
      {@JsonKey(name: 'payee_id') this.payeeId,
      required this.uid,
      required this.name,
      this.normalized});

  factory _$PayeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayeeModelImplFromJson(json);

  @override
  @JsonKey(name: 'payee_id')
  final int? payeeId;
  @override
  final String uid;
  @override
  final String name;
  @override
  final String? normalized;

  @override
  String toString() {
    return 'PayeeModel(payeeId: $payeeId, uid: $uid, name: $name, normalized: $normalized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayeeModelImpl &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.normalized, normalized) ||
                other.normalized == normalized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payeeId, uid, name, normalized);

  /// Create a copy of PayeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayeeModelImplCopyWith<_$PayeeModelImpl> get copyWith =>
      __$$PayeeModelImplCopyWithImpl<_$PayeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayeeModelImplToJson(
      this,
    );
  }
}

abstract class _PayeeModel implements PayeeModel {
  const factory _PayeeModel(
      {@JsonKey(name: 'payee_id') final int? payeeId,
      required final String uid,
      required final String name,
      final String? normalized}) = _$PayeeModelImpl;

  factory _PayeeModel.fromJson(Map<String, dynamic> json) =
      _$PayeeModelImpl.fromJson;

  @override
  @JsonKey(name: 'payee_id')
  int? get payeeId;
  @override
  String get uid;
  @override
  String get name;
  @override
  String? get normalized;

  /// Create a copy of PayeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayeeModelImplCopyWith<_$PayeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
