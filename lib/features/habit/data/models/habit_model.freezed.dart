// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) {
  return _HabitModel.fromJson(json);
}

/// @nodoc
mixin _$HabitModel {
  int? get habitId => throw _privateConstructorUsedError;
  String get habitName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  bool get isBinary => throw _privateConstructorUsedError;
  String get frequencyType => throw _privateConstructorUsedError;
  String? get countType => throw _privateConstructorUsedError;
  double? get target => throw _privateConstructorUsedError;
  String? get targetType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringToList, toJson: listToString)
  List<bool>? get selectedDays => throw _privateConstructorUsedError;
  int? get inEveryXDays => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  bool get reminder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HabitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitModelCopyWith<HabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitModelCopyWith<$Res> {
  factory $HabitModelCopyWith(
          HabitModel value, $Res Function(HabitModel) then) =
      _$HabitModelCopyWithImpl<$Res, HabitModel>;
  @useResult
  $Res call(
      {int? habitId,
      String habitName,
      String description,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) bool isBinary,
      String frequencyType,
      String? countType,
      double? target,
      String? targetType,
      @JsonKey(fromJson: stringToList, toJson: listToString)
      List<bool>? selectedDays,
      int? inEveryXDays,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) bool reminder,
      @JsonKey(fromJson: stringToDate, toJson: dateToString) DateTime createdAt,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      DateTime updatedAt});
}

/// @nodoc
class _$HabitModelCopyWithImpl<$Res, $Val extends HabitModel>
    implements $HabitModelCopyWith<$Res> {
  _$HabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? habitName = null,
    Object? description = null,
    Object? isBinary = null,
    Object? frequencyType = null,
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
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      countType: freezed == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as int?,
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
abstract class _$$HabitModelImplCopyWith<$Res>
    implements $HabitModelCopyWith<$Res> {
  factory _$$HabitModelImplCopyWith(
          _$HabitModelImpl value, $Res Function(_$HabitModelImpl) then) =
      __$$HabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? habitId,
      String habitName,
      String description,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) bool isBinary,
      String frequencyType,
      String? countType,
      double? target,
      String? targetType,
      @JsonKey(fromJson: stringToList, toJson: listToString)
      List<bool>? selectedDays,
      int? inEveryXDays,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) bool reminder,
      @JsonKey(fromJson: stringToDate, toJson: dateToString) DateTime createdAt,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      DateTime updatedAt});
}

/// @nodoc
class __$$HabitModelImplCopyWithImpl<$Res>
    extends _$HabitModelCopyWithImpl<$Res, _$HabitModelImpl>
    implements _$$HabitModelImplCopyWith<$Res> {
  __$$HabitModelImplCopyWithImpl(
      _$HabitModelImpl _value, $Res Function(_$HabitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? habitName = null,
    Object? description = null,
    Object? isBinary = null,
    Object? frequencyType = null,
    Object? countType = freezed,
    Object? target = freezed,
    Object? targetType = freezed,
    Object? selectedDays = freezed,
    Object? inEveryXDays = freezed,
    Object? reminder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$HabitModelImpl(
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
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      countType: freezed == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as int?,
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
@JsonSerializable()
class _$HabitModelImpl implements _HabitModel {
  const _$HabitModelImpl(
      {this.habitId,
      required this.habitName,
      required this.description,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) required this.isBinary,
      required this.frequencyType,
      this.countType,
      this.target,
      this.targetType,
      @JsonKey(fromJson: stringToList, toJson: listToString)
      final List<bool>? selectedDays,
      this.inEveryXDays,
      @JsonKey(fromJson: intToBool, toJson: boolToInt) required this.reminder,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      required this.createdAt,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      required this.updatedAt})
      : _selectedDays = selectedDays;

  factory _$HabitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitModelImplFromJson(json);

  @override
  final int? habitId;
  @override
  final String habitName;
  @override
  final String description;
  @override
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  final bool isBinary;
  @override
  final String frequencyType;
  @override
  final String? countType;
  @override
  final double? target;
  @override
  final String? targetType;
  final List<bool>? _selectedDays;
  @override
  @JsonKey(fromJson: stringToList, toJson: listToString)
  List<bool>? get selectedDays {
    final value = _selectedDays;
    if (value == null) return null;
    if (_selectedDays is EqualUnmodifiableListView) return _selectedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? inEveryXDays;
  @override
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  final bool reminder;
  @override
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'HabitModel(habitId: $habitId, habitName: $habitName, description: $description, isBinary: $isBinary, frequencyType: $frequencyType, countType: $countType, target: $target, targetType: $targetType, selectedDays: $selectedDays, inEveryXDays: $inEveryXDays, reminder: $reminder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      __$$HabitModelImplCopyWithImpl<_$HabitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitModelImplToJson(
      this,
    );
  }
}

abstract class _HabitModel implements HabitModel {
  const factory _HabitModel(
      {final int? habitId,
      required final String habitName,
      required final String description,
      @JsonKey(fromJson: intToBool, toJson: boolToInt)
      required final bool isBinary,
      required final String frequencyType,
      final String? countType,
      final double? target,
      final String? targetType,
      @JsonKey(fromJson: stringToList, toJson: listToString)
      final List<bool>? selectedDays,
      final int? inEveryXDays,
      @JsonKey(fromJson: intToBool, toJson: boolToInt)
      required final bool reminder,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      required final DateTime createdAt,
      @JsonKey(fromJson: stringToDate, toJson: dateToString)
      required final DateTime updatedAt}) = _$HabitModelImpl;

  factory _HabitModel.fromJson(Map<String, dynamic> json) =
      _$HabitModelImpl.fromJson;

  @override
  int? get habitId;
  @override
  String get habitName;
  @override
  String get description;
  @override
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  bool get isBinary;
  @override
  String get frequencyType;
  @override
  String? get countType;
  @override
  double? get target;
  @override
  String? get targetType;
  @override
  @JsonKey(fromJson: stringToList, toJson: listToString)
  List<bool>? get selectedDays;
  @override
  int? get inEveryXDays;
  @override
  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  bool get reminder;
  @override
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: stringToDate, toJson: dateToString)
  DateTime get updatedAt;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
