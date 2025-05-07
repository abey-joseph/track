// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitStatusModel _$HabitStatusModelFromJson(Map<String, dynamic> json) {
  return _HabitStatusModel.fromJson(json);
}

/// @nodoc
mixin _$HabitStatusModel {
  int? get statusId => throw _privateConstructorUsedError;
  int get habitId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime, toJson: toIso)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDecode, toJson: jsonEncode)
  dynamic get value =>
      throw _privateConstructorUsedError; // could be bool, int, double, etc.
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HabitStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitStatusModelCopyWith<HabitStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStatusModelCopyWith<$Res> {
  factory $HabitStatusModelCopyWith(
          HabitStatusModel value, $Res Function(HabitStatusModel) then) =
      _$HabitStatusModelCopyWithImpl<$Res, HabitStatusModel>;
  @useResult
  $Res call(
      {int? statusId,
      int habitId,
      @JsonKey(fromJson: parseDateTime, toJson: toIso) DateTime date,
      @JsonKey(fromJson: jsonDecode, toJson: jsonEncode) dynamic value,
      String? note,
      @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
      DateTime? updatedAt});
}

/// @nodoc
class _$HabitStatusModelCopyWithImpl<$Res, $Val extends HabitStatusModel>
    implements $HabitStatusModelCopyWith<$Res> {
  _$HabitStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitStatusModel
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
abstract class _$$HabitStatusModelImplCopyWith<$Res>
    implements $HabitStatusModelCopyWith<$Res> {
  factory _$$HabitStatusModelImplCopyWith(_$HabitStatusModelImpl value,
          $Res Function(_$HabitStatusModelImpl) then) =
      __$$HabitStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? statusId,
      int habitId,
      @JsonKey(fromJson: parseDateTime, toJson: toIso) DateTime date,
      @JsonKey(fromJson: jsonDecode, toJson: jsonEncode) dynamic value,
      String? note,
      @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
      DateTime? updatedAt});
}

/// @nodoc
class __$$HabitStatusModelImplCopyWithImpl<$Res>
    extends _$HabitStatusModelCopyWithImpl<$Res, _$HabitStatusModelImpl>
    implements _$$HabitStatusModelImplCopyWith<$Res> {
  __$$HabitStatusModelImplCopyWithImpl(_$HabitStatusModelImpl _value,
      $Res Function(_$HabitStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitStatusModel
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
    return _then(_$HabitStatusModelImpl(
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
@JsonSerializable()
class _$HabitStatusModelImpl implements _HabitStatusModel {
  const _$HabitStatusModelImpl(
      {this.statusId,
      required this.habitId,
      @JsonKey(fromJson: parseDateTime, toJson: toIso) required this.date,
      @JsonKey(fromJson: jsonDecode, toJson: jsonEncode) this.value,
      this.note,
      @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
      this.updatedAt});

  factory _$HabitStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitStatusModelImplFromJson(json);

  @override
  final int? statusId;
  @override
  final int habitId;
  @override
  @JsonKey(fromJson: parseDateTime, toJson: toIso)
  final DateTime date;
  @override
  @JsonKey(fromJson: jsonDecode, toJson: jsonEncode)
  final dynamic value;
// could be bool, int, double, etc.
  @override
  final String? note;
  @override
  @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'HabitStatusModel(statusId: $statusId, habitId: $habitId, date: $date, value: $value, note: $note, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitStatusModelImpl &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusId, habitId, date,
      const DeepCollectionEquality().hash(value), note, updatedAt);

  /// Create a copy of HabitStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitStatusModelImplCopyWith<_$HabitStatusModelImpl> get copyWith =>
      __$$HabitStatusModelImplCopyWithImpl<_$HabitStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitStatusModelImplToJson(
      this,
    );
  }
}

abstract class _HabitStatusModel implements HabitStatusModel {
  const factory _HabitStatusModel(
      {final int? statusId,
      required final int habitId,
      @JsonKey(fromJson: parseDateTime, toJson: toIso)
      required final DateTime date,
      @JsonKey(fromJson: jsonDecode, toJson: jsonEncode) final dynamic value,
      final String? note,
      @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
      final DateTime? updatedAt}) = _$HabitStatusModelImpl;

  factory _HabitStatusModel.fromJson(Map<String, dynamic> json) =
      _$HabitStatusModelImpl.fromJson;

  @override
  int? get statusId;
  @override
  int get habitId;
  @override
  @JsonKey(fromJson: parseDateTime, toJson: toIso)
  DateTime get date;
  @override
  @JsonKey(fromJson: jsonDecode, toJson: jsonEncode)
  dynamic get value; // could be bool, int, double, etc.
  @override
  String? get note;
  @override
  @JsonKey(fromJson: parseDateTimeNullable, toJson: toIsoNullable)
  DateTime? get updatedAt;

  /// Create a copy of HabitStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitStatusModelImplCopyWith<_$HabitStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
