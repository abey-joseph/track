// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitEntity {
  int? get habitId => throw _privateConstructorUsedError;
  String get habitName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isBinary => throw _privateConstructorUsedError;
  String? get frequencyType => throw _privateConstructorUsedError;
  String? get countType => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;
  String? get targetType => throw _privateConstructorUsedError;
  List<bool>? get selectedDays => throw _privateConstructorUsedError;
  String? get inEveryXDays => throw _privateConstructorUsedError;
  bool get reminder => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitEntityCopyWith<HabitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntityCopyWith<$Res> {
  factory $HabitEntityCopyWith(
          HabitEntity value, $Res Function(HabitEntity) then) =
      _$HabitEntityCopyWithImpl<$Res, HabitEntity>;
  @useResult
  $Res call(
      {int? habitId,
      String habitName,
      String description,
      bool isBinary,
      String? frequencyType,
      String? countType,
      String? target,
      String? targetType,
      List<bool>? selectedDays,
      String? inEveryXDays,
      bool reminder,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$HabitEntityCopyWithImpl<$Res, $Val extends HabitEntity>
    implements $HabitEntityCopyWith<$Res> {
  _$HabitEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? habitName = null,
    Object? description = null,
    Object? isBinary = null,
    Object? frequencyType = freezed,
    Object? countType = freezed,
    Object? target = freezed,
    Object? targetType = freezed,
    Object? selectedDays = freezed,
    Object? inEveryXDays = freezed,
    Object? reminder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      habitId: freezed == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int?,
      habitName: null == habitName
          ? _value.habitName
          : habitName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isBinary: null == isBinary
          ? _value.isBinary
          : isBinary // ignore: cast_nullable_to_non_nullable
              as bool,
      frequencyType: freezed == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String?,
      countType: freezed == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      targetType: freezed == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDays: freezed == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      inEveryXDays: freezed == inEveryXDays
          ? _value.inEveryXDays
          : inEveryXDays // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: null == reminder
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitEntityImplCopyWith<$Res>
    implements $HabitEntityCopyWith<$Res> {
  factory _$$HabitEntityImplCopyWith(
          _$HabitEntityImpl value, $Res Function(_$HabitEntityImpl) then) =
      __$$HabitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? habitId,
      String habitName,
      String description,
      bool isBinary,
      String? frequencyType,
      String? countType,
      String? target,
      String? targetType,
      List<bool>? selectedDays,
      String? inEveryXDays,
      bool reminder,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$HabitEntityImplCopyWithImpl<$Res>
    extends _$HabitEntityCopyWithImpl<$Res, _$HabitEntityImpl>
    implements _$$HabitEntityImplCopyWith<$Res> {
  __$$HabitEntityImplCopyWithImpl(
      _$HabitEntityImpl _value, $Res Function(_$HabitEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? habitName = null,
    Object? description = null,
    Object? isBinary = null,
    Object? frequencyType = freezed,
    Object? countType = freezed,
    Object? target = freezed,
    Object? targetType = freezed,
    Object? selectedDays = freezed,
    Object? inEveryXDays = freezed,
    Object? reminder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$HabitEntityImpl(
      habitId: freezed == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int?,
      habitName: null == habitName
          ? _value.habitName
          : habitName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isBinary: null == isBinary
          ? _value.isBinary
          : isBinary // ignore: cast_nullable_to_non_nullable
              as bool,
      frequencyType: freezed == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String?,
      countType: freezed == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      targetType: freezed == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDays: freezed == selectedDays
          ? _value._selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      inEveryXDays: freezed == inEveryXDays
          ? _value.inEveryXDays
          : inEveryXDays // ignore: cast_nullable_to_non_nullable
              as String?,
      reminder: null == reminder
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$HabitEntityImpl implements _HabitEntity {
  const _$HabitEntityImpl(
      {this.habitId,
      required this.habitName,
      required this.description,
      required this.isBinary,
      required this.frequencyType,
      this.countType,
      this.target,
      this.targetType,
      final List<bool>? selectedDays,
      this.inEveryXDays,
      required this.reminder,
      required this.createdAt,
      required this.updatedAt})
      : _selectedDays = selectedDays;

  @override
  final int? habitId;
  @override
  final String habitName;
  @override
  final String description;
  @override
  final bool isBinary;
  @override
  final String? frequencyType;
  @override
  final String? countType;
  @override
  final String? target;
  @override
  final String? targetType;
  final List<bool>? _selectedDays;
  @override
  List<bool>? get selectedDays {
    final value = _selectedDays;
    if (value == null) return null;
    if (_selectedDays is EqualUnmodifiableListView) return _selectedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? inEveryXDays;
  @override
  final bool reminder;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'HabitEntity(habitId: $habitId, habitName: $habitName, description: $description, isBinary: $isBinary, frequencyType: $frequencyType, countType: $countType, target: $target, targetType: $targetType, selectedDays: $selectedDays, inEveryXDays: $inEveryXDays, reminder: $reminder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitEntityImpl &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.habitName, habitName) ||
                other.habitName == habitName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isBinary, isBinary) ||
                other.isBinary == isBinary) &&
            (identical(other.frequencyType, frequencyType) ||
                other.frequencyType == frequencyType) &&
            (identical(other.countType, countType) ||
                other.countType == countType) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            const DeepCollectionEquality()
                .equals(other._selectedDays, _selectedDays) &&
            (identical(other.inEveryXDays, inEveryXDays) ||
                other.inEveryXDays == inEveryXDays) &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      habitId,
      habitName,
      description,
      isBinary,
      frequencyType,
      countType,
      target,
      targetType,
      const DeepCollectionEquality().hash(_selectedDays),
      inEveryXDays,
      reminder,
      createdAt,
      updatedAt);

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntityImplCopyWith<_$HabitEntityImpl> get copyWith =>
      __$$HabitEntityImplCopyWithImpl<_$HabitEntityImpl>(this, _$identity);
}

abstract class _HabitEntity implements HabitEntity {
  const factory _HabitEntity(
      {final int? habitId,
      required final String habitName,
      required final String description,
      required final bool isBinary,
      required final String? frequencyType,
      final String? countType,
      final String? target,
      final String? targetType,
      final List<bool>? selectedDays,
      final String? inEveryXDays,
      required final bool reminder,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$HabitEntityImpl;

  @override
  int? get habitId;
  @override
  String get habitName;
  @override
  String get description;
  @override
  bool get isBinary;
  @override
  String? get frequencyType;
  @override
  String? get countType;
  @override
  String? get target;
  @override
  String? get targetType;
  @override
  List<bool>? get selectedDays;
  @override
  String? get inEveryXDays;
  @override
  bool get reminder;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntityImplCopyWith<_$HabitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
