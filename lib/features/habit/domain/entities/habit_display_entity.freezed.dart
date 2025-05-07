// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_display_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitDisplayEntity {
  HabitEntity get habit => throw _privateConstructorUsedError;
  List<HabitStatusEntity> get statusList => throw _privateConstructorUsedError;

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitDisplayEntityCopyWith<HabitDisplayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitDisplayEntityCopyWith<$Res> {
  factory $HabitDisplayEntityCopyWith(
          HabitDisplayEntity value, $Res Function(HabitDisplayEntity) then) =
      _$HabitDisplayEntityCopyWithImpl<$Res, HabitDisplayEntity>;
  @useResult
  $Res call({HabitEntity habit, List<HabitStatusEntity> statusList});

  $HabitEntityCopyWith<$Res> get habit;
}

/// @nodoc
class _$HabitDisplayEntityCopyWithImpl<$Res, $Val extends HabitDisplayEntity>
    implements $HabitDisplayEntityCopyWith<$Res> {
  _$HabitDisplayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? statusList = null,
  }) {
    return _then(_value.copyWith(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as HabitEntity,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<HabitStatusEntity>,
    ) as $Val);
  }

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitEntityCopyWith<$Res> get habit {
    return $HabitEntityCopyWith<$Res>(_value.habit, (value) {
      return _then(_value.copyWith(habit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HabitDisplayEntityImplCopyWith<$Res>
    implements $HabitDisplayEntityCopyWith<$Res> {
  factory _$$HabitDisplayEntityImplCopyWith(_$HabitDisplayEntityImpl value,
          $Res Function(_$HabitDisplayEntityImpl) then) =
      __$$HabitDisplayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HabitEntity habit, List<HabitStatusEntity> statusList});

  @override
  $HabitEntityCopyWith<$Res> get habit;
}

/// @nodoc
class __$$HabitDisplayEntityImplCopyWithImpl<$Res>
    extends _$HabitDisplayEntityCopyWithImpl<$Res, _$HabitDisplayEntityImpl>
    implements _$$HabitDisplayEntityImplCopyWith<$Res> {
  __$$HabitDisplayEntityImplCopyWithImpl(_$HabitDisplayEntityImpl _value,
      $Res Function(_$HabitDisplayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? statusList = null,
  }) {
    return _then(_$HabitDisplayEntityImpl(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as HabitEntity,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<HabitStatusEntity>,
    ));
  }
}

/// @nodoc

class _$HabitDisplayEntityImpl implements _HabitDisplayEntity {
  const _$HabitDisplayEntityImpl(
      {required this.habit, required final List<HabitStatusEntity> statusList})
      : _statusList = statusList;

  @override
  final HabitEntity habit;
  final List<HabitStatusEntity> _statusList;
  @override
  List<HabitStatusEntity> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  @override
  String toString() {
    return 'HabitDisplayEntity(habit: $habit, statusList: $statusList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitDisplayEntityImpl &&
            (identical(other.habit, habit) || other.habit == habit) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, habit, const DeepCollectionEquality().hash(_statusList));

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitDisplayEntityImplCopyWith<_$HabitDisplayEntityImpl> get copyWith =>
      __$$HabitDisplayEntityImplCopyWithImpl<_$HabitDisplayEntityImpl>(
          this, _$identity);
}

abstract class _HabitDisplayEntity implements HabitDisplayEntity {
  const factory _HabitDisplayEntity(
          {required final HabitEntity habit,
          required final List<HabitStatusEntity> statusList}) =
      _$HabitDisplayEntityImpl;

  @override
  HabitEntity get habit;
  @override
  List<HabitStatusEntity> get statusList;

  /// Create a copy of HabitDisplayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitDisplayEntityImplCopyWith<_$HabitDisplayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
