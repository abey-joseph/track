// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_status_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitStatusEntity {
  int? get statusId => throw _privateConstructorUsedError;
  int get habitId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of HabitStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitStatusEntityCopyWith<HabitStatusEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStatusEntityCopyWith<$Res> {
  factory $HabitStatusEntityCopyWith(
          HabitStatusEntity value, $Res Function(HabitStatusEntity) then) =
      _$HabitStatusEntityCopyWithImpl<$Res, HabitStatusEntity>;
  @useResult
  $Res call(
      {int? statusId,
      int habitId,
      DateTime date,
      dynamic value,
      String? note,
      DateTime? updatedAt});
}

/// @nodoc
class _$HabitStatusEntityCopyWithImpl<$Res, $Val extends HabitStatusEntity>
    implements $HabitStatusEntityCopyWith<$Res> {
  _$HabitStatusEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusId = freezed,
    Object? habitId = null,
    Object? date = null,
    Object? value = freezed,
    Object? note = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitStatusEntityImplCopyWith<$Res>
    implements $HabitStatusEntityCopyWith<$Res> {
  factory _$$HabitStatusEntityImplCopyWith(_$HabitStatusEntityImpl value,
          $Res Function(_$HabitStatusEntityImpl) then) =
      __$$HabitStatusEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? statusId,
      int habitId,
      DateTime date,
      dynamic value,
      String? note,
      DateTime? updatedAt});
}

/// @nodoc
class __$$HabitStatusEntityImplCopyWithImpl<$Res>
    extends _$HabitStatusEntityCopyWithImpl<$Res, _$HabitStatusEntityImpl>
    implements _$$HabitStatusEntityImplCopyWith<$Res> {
  __$$HabitStatusEntityImplCopyWithImpl(_$HabitStatusEntityImpl _value,
      $Res Function(_$HabitStatusEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusId = freezed,
    Object? habitId = null,
    Object? date = null,
    Object? value = freezed,
    Object? note = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$HabitStatusEntityImpl(
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$HabitStatusEntityImpl implements _HabitStatusEntity {
  const _$HabitStatusEntityImpl(
      {this.statusId,
      required this.habitId,
      required this.date,
      required this.value,
      this.note,
      this.updatedAt});

  @override
  final int? statusId;
  @override
  final int habitId;
  @override
  final DateTime date;
  @override
  final dynamic value;
  @override
  final String? note;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'HabitStatusEntity(statusId: $statusId, habitId: $habitId, date: $date, value: $value, note: $note, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitStatusEntityImpl &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusId, habitId, date,
      const DeepCollectionEquality().hash(value), note, updatedAt);

  /// Create a copy of HabitStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitStatusEntityImplCopyWith<_$HabitStatusEntityImpl> get copyWith =>
      __$$HabitStatusEntityImplCopyWithImpl<_$HabitStatusEntityImpl>(
          this, _$identity);
}

abstract class _HabitStatusEntity implements HabitStatusEntity {
  const factory _HabitStatusEntity(
      {final int? statusId,
      required final int habitId,
      required final DateTime date,
      required final dynamic value,
      final String? note,
      final DateTime? updatedAt}) = _$HabitStatusEntityImpl;

  @override
  int? get statusId;
  @override
  int get habitId;
  @override
  DateTime get date;
  @override
  dynamic get value;
  @override
  String? get note;
  @override
  DateTime? get updatedAt;

  /// Create a copy of HabitStatusEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitStatusEntityImplCopyWith<_$HabitStatusEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
