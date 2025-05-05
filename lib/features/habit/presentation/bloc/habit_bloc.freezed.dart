// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEventCopyWith<$Res> {
  factory $HabitEventCopyWith(
          HabitEvent value, $Res Function(HabitEvent) then) =
      _$HabitEventCopyWithImpl<$Res, HabitEvent>;
}

/// @nodoc
class _$HabitEventCopyWithImpl<$Res, $Val extends HabitEvent>
    implements $HabitEventCopyWith<$Res> {
  _$HabitEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartHabitEventImplCopyWith<$Res> {
  factory _$$StartHabitEventImplCopyWith(_$StartHabitEventImpl value,
          $Res Function(_$StartHabitEventImpl) then) =
      __$$StartHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$StartHabitEventImpl>
    implements _$$StartHabitEventImplCopyWith<$Res> {
  __$$StartHabitEventImplCopyWithImpl(
      _$StartHabitEventImpl _value, $Res Function(_$StartHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartHabitEventImpl implements StartHabitEvent {
  const _$StartHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.startHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return startHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return startHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (startHabitEvent != null) {
      return startHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return startHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return startHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (startHabitEvent != null) {
      return startHabitEvent(this);
    }
    return orElse();
  }
}

abstract class StartHabitEvent implements HabitEvent {
  const factory StartHabitEvent() = _$StartHabitEventImpl;
}

/// @nodoc
abstract class _$$FetchHabitsDataToUpdateMainUIImplCopyWith<$Res> {
  factory _$$FetchHabitsDataToUpdateMainUIImplCopyWith(
          _$FetchHabitsDataToUpdateMainUIImpl value,
          $Res Function(_$FetchHabitsDataToUpdateMainUIImpl) then) =
      __$$FetchHabitsDataToUpdateMainUIImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHabitsDataToUpdateMainUIImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$FetchHabitsDataToUpdateMainUIImpl>
    implements _$$FetchHabitsDataToUpdateMainUIImplCopyWith<$Res> {
  __$$FetchHabitsDataToUpdateMainUIImplCopyWithImpl(
      _$FetchHabitsDataToUpdateMainUIImpl _value,
      $Res Function(_$FetchHabitsDataToUpdateMainUIImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchHabitsDataToUpdateMainUIImpl
    implements FetchHabitsDataToUpdateMainUI {
  const _$FetchHabitsDataToUpdateMainUIImpl();

  @override
  String toString() {
    return 'HabitEvent.fetchHabitsDataToUpdateMainUI()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHabitsDataToUpdateMainUIImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return fetchHabitsDataToUpdateMainUI();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return fetchHabitsDataToUpdateMainUI?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (fetchHabitsDataToUpdateMainUI != null) {
      return fetchHabitsDataToUpdateMainUI();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return fetchHabitsDataToUpdateMainUI(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return fetchHabitsDataToUpdateMainUI?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (fetchHabitsDataToUpdateMainUI != null) {
      return fetchHabitsDataToUpdateMainUI(this);
    }
    return orElse();
  }
}

abstract class FetchHabitsDataToUpdateMainUI implements HabitEvent {
  const factory FetchHabitsDataToUpdateMainUI() =
      _$FetchHabitsDataToUpdateMainUIImpl;
}

/// @nodoc
abstract class _$$CheckDateToFindDifferenceHabitEventImplCopyWith<$Res> {
  factory _$$CheckDateToFindDifferenceHabitEventImplCopyWith(
          _$CheckDateToFindDifferenceHabitEventImpl value,
          $Res Function(_$CheckDateToFindDifferenceHabitEventImpl) then) =
      __$$CheckDateToFindDifferenceHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckDateToFindDifferenceHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res,
        _$CheckDateToFindDifferenceHabitEventImpl>
    implements _$$CheckDateToFindDifferenceHabitEventImplCopyWith<$Res> {
  __$$CheckDateToFindDifferenceHabitEventImplCopyWithImpl(
      _$CheckDateToFindDifferenceHabitEventImpl _value,
      $Res Function(_$CheckDateToFindDifferenceHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckDateToFindDifferenceHabitEventImpl
    implements CheckDateToFindDifferenceHabitEvent {
  const _$CheckDateToFindDifferenceHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.checkDateToFindDifferenceHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckDateToFindDifferenceHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return checkDateToFindDifferenceHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return checkDateToFindDifferenceHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (checkDateToFindDifferenceHabitEvent != null) {
      return checkDateToFindDifferenceHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return checkDateToFindDifferenceHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return checkDateToFindDifferenceHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (checkDateToFindDifferenceHabitEvent != null) {
      return checkDateToFindDifferenceHabitEvent(this);
    }
    return orElse();
  }
}

abstract class CheckDateToFindDifferenceHabitEvent implements HabitEvent {
  const factory CheckDateToFindDifferenceHabitEvent() =
      _$CheckDateToFindDifferenceHabitEventImpl;
}

/// @nodoc
abstract class _$$DateDifferentHabitEventImplCopyWith<$Res> {
  factory _$$DateDifferentHabitEventImplCopyWith(
          _$DateDifferentHabitEventImpl value,
          $Res Function(_$DateDifferentHabitEventImpl) then) =
      __$$DateDifferentHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DateDifferentHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$DateDifferentHabitEventImpl>
    implements _$$DateDifferentHabitEventImplCopyWith<$Res> {
  __$$DateDifferentHabitEventImplCopyWithImpl(
      _$DateDifferentHabitEventImpl _value,
      $Res Function(_$DateDifferentHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DateDifferentHabitEventImpl implements DateDifferentHabitEvent {
  const _$DateDifferentHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.dateDifferentHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateDifferentHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return dateDifferentHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return dateDifferentHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (dateDifferentHabitEvent != null) {
      return dateDifferentHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return dateDifferentHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return dateDifferentHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (dateDifferentHabitEvent != null) {
      return dateDifferentHabitEvent(this);
    }
    return orElse();
  }
}

abstract class DateDifferentHabitEvent implements HabitEvent {
  const factory DateDifferentHabitEvent() = _$DateDifferentHabitEventImpl;
}

/// @nodoc
abstract class _$$AddHabitEventImplCopyWith<$Res> {
  factory _$$AddHabitEventImplCopyWith(
          _$AddHabitEventImpl value, $Res Function(_$AddHabitEventImpl) then) =
      __$$AddHabitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HabitEntity habitEntity});

  $HabitEntityCopyWith<$Res> get habitEntity;
}

/// @nodoc
class __$$AddHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$AddHabitEventImpl>
    implements _$$AddHabitEventImplCopyWith<$Res> {
  __$$AddHabitEventImplCopyWithImpl(
      _$AddHabitEventImpl _value, $Res Function(_$AddHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitEntity = null,
  }) {
    return _then(_$AddHabitEventImpl(
      habitEntity: null == habitEntity
          ? _value.habitEntity
          : habitEntity // ignore: cast_nullable_to_non_nullable
              as HabitEntity,
    ));
  }

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitEntityCopyWith<$Res> get habitEntity {
    return $HabitEntityCopyWith<$Res>(_value.habitEntity, (value) {
      return _then(_value.copyWith(habitEntity: value));
    });
  }
}

/// @nodoc

class _$AddHabitEventImpl implements AddHabitEvent {
  const _$AddHabitEventImpl({required this.habitEntity});

  @override
  final HabitEntity habitEntity;

  @override
  String toString() {
    return 'HabitEvent.addHabitEvent(habitEntity: $habitEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddHabitEventImpl &&
            (identical(other.habitEntity, habitEntity) ||
                other.habitEntity == habitEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habitEntity);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddHabitEventImplCopyWith<_$AddHabitEventImpl> get copyWith =>
      __$$AddHabitEventImplCopyWithImpl<_$AddHabitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return addHabitEvent(habitEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return addHabitEvent?.call(habitEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (addHabitEvent != null) {
      return addHabitEvent(habitEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return addHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return addHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (addHabitEvent != null) {
      return addHabitEvent(this);
    }
    return orElse();
  }
}

abstract class AddHabitEvent implements HabitEvent {
  const factory AddHabitEvent({required final HabitEntity habitEntity}) =
      _$AddHabitEventImpl;

  HabitEntity get habitEntity;

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddHabitEventImplCopyWith<_$AddHabitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditHabitEventImplCopyWith<$Res> {
  factory _$$EditHabitEventImplCopyWith(_$EditHabitEventImpl value,
          $Res Function(_$EditHabitEventImpl) then) =
      __$$EditHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$EditHabitEventImpl>
    implements _$$EditHabitEventImplCopyWith<$Res> {
  __$$EditHabitEventImplCopyWithImpl(
      _$EditHabitEventImpl _value, $Res Function(_$EditHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EditHabitEventImpl implements EditHabitEvent {
  const _$EditHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.editHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return editHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return editHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (editHabitEvent != null) {
      return editHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return editHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return editHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (editHabitEvent != null) {
      return editHabitEvent(this);
    }
    return orElse();
  }
}

abstract class EditHabitEvent implements HabitEvent {
  const factory EditHabitEvent() = _$EditHabitEventImpl;
}

/// @nodoc
abstract class _$$DeleteHabitEventImplCopyWith<$Res> {
  factory _$$DeleteHabitEventImplCopyWith(_$DeleteHabitEventImpl value,
          $Res Function(_$DeleteHabitEventImpl) then) =
      __$$DeleteHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$DeleteHabitEventImpl>
    implements _$$DeleteHabitEventImplCopyWith<$Res> {
  __$$DeleteHabitEventImplCopyWithImpl(_$DeleteHabitEventImpl _value,
      $Res Function(_$DeleteHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteHabitEventImpl implements DeleteHabitEvent {
  const _$DeleteHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.deleteHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return deleteHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return deleteHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (deleteHabitEvent != null) {
      return deleteHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return deleteHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return deleteHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (deleteHabitEvent != null) {
      return deleteHabitEvent(this);
    }
    return orElse();
  }
}

abstract class DeleteHabitEvent implements HabitEvent {
  const factory DeleteHabitEvent() = _$DeleteHabitEventImpl;
}

/// @nodoc
abstract class _$$ChangeStatusHabitEventImplCopyWith<$Res> {
  factory _$$ChangeStatusHabitEventImplCopyWith(
          _$ChangeStatusHabitEventImpl value,
          $Res Function(_$ChangeStatusHabitEventImpl) then) =
      __$$ChangeStatusHabitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeStatusHabitEventImplCopyWithImpl<$Res>
    extends _$HabitEventCopyWithImpl<$Res, _$ChangeStatusHabitEventImpl>
    implements _$$ChangeStatusHabitEventImplCopyWith<$Res> {
  __$$ChangeStatusHabitEventImplCopyWithImpl(
      _$ChangeStatusHabitEventImpl _value,
      $Res Function(_$ChangeStatusHabitEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChangeStatusHabitEventImpl implements ChangeStatusHabitEvent {
  const _$ChangeStatusHabitEventImpl();

  @override
  String toString() {
    return 'HabitEvent.changeStatusHabitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStatusHabitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startHabitEvent,
    required TResult Function() fetchHabitsDataToUpdateMainUI,
    required TResult Function() checkDateToFindDifferenceHabitEvent,
    required TResult Function() dateDifferentHabitEvent,
    required TResult Function(HabitEntity habitEntity) addHabitEvent,
    required TResult Function() editHabitEvent,
    required TResult Function() deleteHabitEvent,
    required TResult Function() changeStatusHabitEvent,
  }) {
    return changeStatusHabitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startHabitEvent,
    TResult? Function()? fetchHabitsDataToUpdateMainUI,
    TResult? Function()? checkDateToFindDifferenceHabitEvent,
    TResult? Function()? dateDifferentHabitEvent,
    TResult? Function(HabitEntity habitEntity)? addHabitEvent,
    TResult? Function()? editHabitEvent,
    TResult? Function()? deleteHabitEvent,
    TResult? Function()? changeStatusHabitEvent,
  }) {
    return changeStatusHabitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startHabitEvent,
    TResult Function()? fetchHabitsDataToUpdateMainUI,
    TResult Function()? checkDateToFindDifferenceHabitEvent,
    TResult Function()? dateDifferentHabitEvent,
    TResult Function(HabitEntity habitEntity)? addHabitEvent,
    TResult Function()? editHabitEvent,
    TResult Function()? deleteHabitEvent,
    TResult Function()? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (changeStatusHabitEvent != null) {
      return changeStatusHabitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartHabitEvent value) startHabitEvent,
    required TResult Function(FetchHabitsDataToUpdateMainUI value)
        fetchHabitsDataToUpdateMainUI,
    required TResult Function(CheckDateToFindDifferenceHabitEvent value)
        checkDateToFindDifferenceHabitEvent,
    required TResult Function(DateDifferentHabitEvent value)
        dateDifferentHabitEvent,
    required TResult Function(AddHabitEvent value) addHabitEvent,
    required TResult Function(EditHabitEvent value) editHabitEvent,
    required TResult Function(DeleteHabitEvent value) deleteHabitEvent,
    required TResult Function(ChangeStatusHabitEvent value)
        changeStatusHabitEvent,
  }) {
    return changeStatusHabitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartHabitEvent value)? startHabitEvent,
    TResult? Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult? Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult? Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult? Function(AddHabitEvent value)? addHabitEvent,
    TResult? Function(EditHabitEvent value)? editHabitEvent,
    TResult? Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult? Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
  }) {
    return changeStatusHabitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartHabitEvent value)? startHabitEvent,
    TResult Function(FetchHabitsDataToUpdateMainUI value)?
        fetchHabitsDataToUpdateMainUI,
    TResult Function(CheckDateToFindDifferenceHabitEvent value)?
        checkDateToFindDifferenceHabitEvent,
    TResult Function(DateDifferentHabitEvent value)? dateDifferentHabitEvent,
    TResult Function(AddHabitEvent value)? addHabitEvent,
    TResult Function(EditHabitEvent value)? editHabitEvent,
    TResult Function(DeleteHabitEvent value)? deleteHabitEvent,
    TResult Function(ChangeStatusHabitEvent value)? changeStatusHabitEvent,
    required TResult orElse(),
  }) {
    if (changeStatusHabitEvent != null) {
      return changeStatusHabitEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeStatusHabitEvent implements HabitEvent {
  const factory ChangeStatusHabitEvent() = _$ChangeStatusHabitEventImpl;
}

/// @nodoc
mixin _$HabitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStateCopyWith<$Res> {
  factory $HabitStateCopyWith(
          HabitState value, $Res Function(HabitState) then) =
      _$HabitStateCopyWithImpl<$Res, HabitState>;
}

/// @nodoc
class _$HabitStateCopyWithImpl<$Res, $Val extends HabitState>
    implements $HabitStateCopyWith<$Res> {
  _$HabitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HabitInitialImplCopyWith<$Res> {
  factory _$$HabitInitialImplCopyWith(
          _$HabitInitialImpl value, $Res Function(_$HabitInitialImpl) then) =
      __$$HabitInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HabitInitialImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$HabitInitialImpl>
    implements _$$HabitInitialImplCopyWith<$Res> {
  __$$HabitInitialImplCopyWithImpl(
      _$HabitInitialImpl _value, $Res Function(_$HabitInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HabitInitialImpl implements HabitInitial {
  const _$HabitInitialImpl();

  @override
  String toString() {
    return 'HabitState.habitInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HabitInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return habitInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return habitInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (habitInitial != null) {
      return habitInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return habitInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return habitInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (habitInitial != null) {
      return habitInitial(this);
    }
    return orElse();
  }
}

abstract class HabitInitial implements HabitState {
  const factory HabitInitial() = _$HabitInitialImpl;
}

/// @nodoc
abstract class _$$LoadingHabitStateImplCopyWith<$Res> {
  factory _$$LoadingHabitStateImplCopyWith(_$LoadingHabitStateImpl value,
          $Res Function(_$LoadingHabitStateImpl) then) =
      __$$LoadingHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$LoadingHabitStateImpl>
    implements _$$LoadingHabitStateImplCopyWith<$Res> {
  __$$LoadingHabitStateImplCopyWithImpl(_$LoadingHabitStateImpl _value,
      $Res Function(_$LoadingHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingHabitStateImpl implements LoadingHabitState {
  const _$LoadingHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.loadingHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return loadingHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return loadingHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (loadingHabitState != null) {
      return loadingHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return loadingHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return loadingHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (loadingHabitState != null) {
      return loadingHabitState(this);
    }
    return orElse();
  }
}

abstract class LoadingHabitState implements HabitState {
  const factory LoadingHabitState() = _$LoadingHabitStateImpl;
}

/// @nodoc
abstract class _$$MainUpdateHabitStateImplCopyWith<$Res> {
  factory _$$MainUpdateHabitStateImplCopyWith(_$MainUpdateHabitStateImpl value,
          $Res Function(_$MainUpdateHabitStateImpl) then) =
      __$$MainUpdateHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainUpdateHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$MainUpdateHabitStateImpl>
    implements _$$MainUpdateHabitStateImplCopyWith<$Res> {
  __$$MainUpdateHabitStateImplCopyWithImpl(_$MainUpdateHabitStateImpl _value,
      $Res Function(_$MainUpdateHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MainUpdateHabitStateImpl implements MainUpdateHabitState {
  const _$MainUpdateHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.mainUpdateHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainUpdateHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return mainUpdateHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return mainUpdateHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (mainUpdateHabitState != null) {
      return mainUpdateHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return mainUpdateHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return mainUpdateHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (mainUpdateHabitState != null) {
      return mainUpdateHabitState(this);
    }
    return orElse();
  }
}

abstract class MainUpdateHabitState implements HabitState {
  const factory MainUpdateHabitState() = _$MainUpdateHabitStateImpl;
}

/// @nodoc
abstract class _$$StatusUpdateHabitStateImplCopyWith<$Res> {
  factory _$$StatusUpdateHabitStateImplCopyWith(
          _$StatusUpdateHabitStateImpl value,
          $Res Function(_$StatusUpdateHabitStateImpl) then) =
      __$$StatusUpdateHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusUpdateHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$StatusUpdateHabitStateImpl>
    implements _$$StatusUpdateHabitStateImplCopyWith<$Res> {
  __$$StatusUpdateHabitStateImplCopyWithImpl(
      _$StatusUpdateHabitStateImpl _value,
      $Res Function(_$StatusUpdateHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusUpdateHabitStateImpl implements StatusUpdateHabitState {
  const _$StatusUpdateHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.statusUpdateHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusUpdateHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return statusUpdateHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return statusUpdateHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (statusUpdateHabitState != null) {
      return statusUpdateHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return statusUpdateHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return statusUpdateHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (statusUpdateHabitState != null) {
      return statusUpdateHabitState(this);
    }
    return orElse();
  }
}

abstract class StatusUpdateHabitState implements HabitState {
  const factory StatusUpdateHabitState() = _$StatusUpdateHabitStateImpl;
}

/// @nodoc
abstract class _$$ErrorHabitStateImplCopyWith<$Res> {
  factory _$$ErrorHabitStateImplCopyWith(_$ErrorHabitStateImpl value,
          $Res Function(_$ErrorHabitStateImpl) then) =
      __$$ErrorHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$ErrorHabitStateImpl>
    implements _$$ErrorHabitStateImplCopyWith<$Res> {
  __$$ErrorHabitStateImplCopyWithImpl(
      _$ErrorHabitStateImpl _value, $Res Function(_$ErrorHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorHabitStateImpl implements ErrorHabitState {
  const _$ErrorHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.errorHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return errorHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return errorHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (errorHabitState != null) {
      return errorHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return errorHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return errorHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (errorHabitState != null) {
      return errorHabitState(this);
    }
    return orElse();
  }
}

abstract class ErrorHabitState implements HabitState {
  const factory ErrorHabitState() = _$ErrorHabitStateImpl;
}

/// @nodoc
abstract class _$$AddDoneHabitStateImplCopyWith<$Res> {
  factory _$$AddDoneHabitStateImplCopyWith(_$AddDoneHabitStateImpl value,
          $Res Function(_$AddDoneHabitStateImpl) then) =
      __$$AddDoneHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddDoneHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$AddDoneHabitStateImpl>
    implements _$$AddDoneHabitStateImplCopyWith<$Res> {
  __$$AddDoneHabitStateImplCopyWithImpl(_$AddDoneHabitStateImpl _value,
      $Res Function(_$AddDoneHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddDoneHabitStateImpl implements AddDoneHabitState {
  const _$AddDoneHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.addDoneHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddDoneHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return addDoneHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return addDoneHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (addDoneHabitState != null) {
      return addDoneHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return addDoneHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return addDoneHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (addDoneHabitState != null) {
      return addDoneHabitState(this);
    }
    return orElse();
  }
}

abstract class AddDoneHabitState implements HabitState {
  const factory AddDoneHabitState() = _$AddDoneHabitStateImpl;
}

/// @nodoc
abstract class _$$AddFailedHabitStateImplCopyWith<$Res> {
  factory _$$AddFailedHabitStateImplCopyWith(_$AddFailedHabitStateImpl value,
          $Res Function(_$AddFailedHabitStateImpl) then) =
      __$$AddFailedHabitStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddFailedHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$AddFailedHabitStateImpl>
    implements _$$AddFailedHabitStateImplCopyWith<$Res> {
  __$$AddFailedHabitStateImplCopyWithImpl(_$AddFailedHabitStateImpl _value,
      $Res Function(_$AddFailedHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddFailedHabitStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddFailedHabitStateImpl implements AddFailedHabitState {
  const _$AddFailedHabitStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'HabitState.addFailedHabitState(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFailedHabitStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFailedHabitStateImplCopyWith<_$AddFailedHabitStateImpl> get copyWith =>
      __$$AddFailedHabitStateImplCopyWithImpl<_$AddFailedHabitStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return addFailedHabitState(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return addFailedHabitState?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (addFailedHabitState != null) {
      return addFailedHabitState(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return addFailedHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return addFailedHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (addFailedHabitState != null) {
      return addFailedHabitState(this);
    }
    return orElse();
  }
}

abstract class AddFailedHabitState implements HabitState {
  const factory AddFailedHabitState({required final String error}) =
      _$AddFailedHabitStateImpl;

  String get error;

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFailedHabitStateImplCopyWith<_$AddFailedHabitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDoneHabitStateImplCopyWith<$Res> {
  factory _$$DeleteDoneHabitStateImplCopyWith(_$DeleteDoneHabitStateImpl value,
          $Res Function(_$DeleteDoneHabitStateImpl) then) =
      __$$DeleteDoneHabitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteDoneHabitStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res, _$DeleteDoneHabitStateImpl>
    implements _$$DeleteDoneHabitStateImplCopyWith<$Res> {
  __$$DeleteDoneHabitStateImplCopyWithImpl(_$DeleteDoneHabitStateImpl _value,
      $Res Function(_$DeleteDoneHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteDoneHabitStateImpl implements DeleteDoneHabitState {
  const _$DeleteDoneHabitStateImpl();

  @override
  String toString() {
    return 'HabitState.deleteDoneHabitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDoneHabitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return deleteDoneHabitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return deleteDoneHabitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (deleteDoneHabitState != null) {
      return deleteDoneHabitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return deleteDoneHabitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return deleteDoneHabitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (deleteDoneHabitState != null) {
      return deleteDoneHabitState(this);
    }
    return orElse();
  }
}

abstract class DeleteDoneHabitState implements HabitState {
  const factory DeleteDoneHabitState() = _$DeleteDoneHabitStateImpl;
}

/// @nodoc
abstract class _$$dateListForDateHeadUpdatedStateImplCopyWith<$Res> {
  factory _$$dateListForDateHeadUpdatedStateImplCopyWith(
          _$dateListForDateHeadUpdatedStateImpl value,
          $Res Function(_$dateListForDateHeadUpdatedStateImpl) then) =
      __$$dateListForDateHeadUpdatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, String>> dateList});
}

/// @nodoc
class __$$dateListForDateHeadUpdatedStateImplCopyWithImpl<$Res>
    extends _$HabitStateCopyWithImpl<$Res,
        _$dateListForDateHeadUpdatedStateImpl>
    implements _$$dateListForDateHeadUpdatedStateImplCopyWith<$Res> {
  __$$dateListForDateHeadUpdatedStateImplCopyWithImpl(
      _$dateListForDateHeadUpdatedStateImpl _value,
      $Res Function(_$dateListForDateHeadUpdatedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateList = null,
  }) {
    return _then(_$dateListForDateHeadUpdatedStateImpl(
      dateList: null == dateList
          ? _value._dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc

class _$dateListForDateHeadUpdatedStateImpl
    implements dateListForDateHeadUpdatedState {
  const _$dateListForDateHeadUpdatedStateImpl(
      {required final List<Map<String, String>> dateList})
      : _dateList = dateList;

  final List<Map<String, String>> _dateList;
  @override
  List<Map<String, String>> get dateList {
    if (_dateList is EqualUnmodifiableListView) return _dateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateList);
  }

  @override
  String toString() {
    return 'HabitState.dateListForDateHeadUpdatedState(dateList: $dateList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$dateListForDateHeadUpdatedStateImpl &&
            const DeepCollectionEquality().equals(other._dateList, _dateList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dateList));

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$dateListForDateHeadUpdatedStateImplCopyWith<
          _$dateListForDateHeadUpdatedStateImpl>
      get copyWith => __$$dateListForDateHeadUpdatedStateImplCopyWithImpl<
          _$dateListForDateHeadUpdatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() habitInitial,
    required TResult Function() loadingHabitState,
    required TResult Function() mainUpdateHabitState,
    required TResult Function() statusUpdateHabitState,
    required TResult Function() errorHabitState,
    required TResult Function() addDoneHabitState,
    required TResult Function(String error) addFailedHabitState,
    required TResult Function() deleteDoneHabitState,
    required TResult Function(List<Map<String, String>> dateList)
        dateListForDateHeadUpdatedState,
  }) {
    return dateListForDateHeadUpdatedState(dateList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? habitInitial,
    TResult? Function()? loadingHabitState,
    TResult? Function()? mainUpdateHabitState,
    TResult? Function()? statusUpdateHabitState,
    TResult? Function()? errorHabitState,
    TResult? Function()? addDoneHabitState,
    TResult? Function(String error)? addFailedHabitState,
    TResult? Function()? deleteDoneHabitState,
    TResult? Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
  }) {
    return dateListForDateHeadUpdatedState?.call(dateList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? habitInitial,
    TResult Function()? loadingHabitState,
    TResult Function()? mainUpdateHabitState,
    TResult Function()? statusUpdateHabitState,
    TResult Function()? errorHabitState,
    TResult Function()? addDoneHabitState,
    TResult Function(String error)? addFailedHabitState,
    TResult Function()? deleteDoneHabitState,
    TResult Function(List<Map<String, String>> dateList)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (dateListForDateHeadUpdatedState != null) {
      return dateListForDateHeadUpdatedState(dateList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HabitInitial value) habitInitial,
    required TResult Function(LoadingHabitState value) loadingHabitState,
    required TResult Function(MainUpdateHabitState value) mainUpdateHabitState,
    required TResult Function(StatusUpdateHabitState value)
        statusUpdateHabitState,
    required TResult Function(ErrorHabitState value) errorHabitState,
    required TResult Function(AddDoneHabitState value) addDoneHabitState,
    required TResult Function(AddFailedHabitState value) addFailedHabitState,
    required TResult Function(DeleteDoneHabitState value) deleteDoneHabitState,
    required TResult Function(dateListForDateHeadUpdatedState value)
        dateListForDateHeadUpdatedState,
  }) {
    return dateListForDateHeadUpdatedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HabitInitial value)? habitInitial,
    TResult? Function(LoadingHabitState value)? loadingHabitState,
    TResult? Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult? Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult? Function(ErrorHabitState value)? errorHabitState,
    TResult? Function(AddDoneHabitState value)? addDoneHabitState,
    TResult? Function(AddFailedHabitState value)? addFailedHabitState,
    TResult? Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult? Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
  }) {
    return dateListForDateHeadUpdatedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HabitInitial value)? habitInitial,
    TResult Function(LoadingHabitState value)? loadingHabitState,
    TResult Function(MainUpdateHabitState value)? mainUpdateHabitState,
    TResult Function(StatusUpdateHabitState value)? statusUpdateHabitState,
    TResult Function(ErrorHabitState value)? errorHabitState,
    TResult Function(AddDoneHabitState value)? addDoneHabitState,
    TResult Function(AddFailedHabitState value)? addFailedHabitState,
    TResult Function(DeleteDoneHabitState value)? deleteDoneHabitState,
    TResult Function(dateListForDateHeadUpdatedState value)?
        dateListForDateHeadUpdatedState,
    required TResult orElse(),
  }) {
    if (dateListForDateHeadUpdatedState != null) {
      return dateListForDateHeadUpdatedState(this);
    }
    return orElse();
  }
}

abstract class dateListForDateHeadUpdatedState implements HabitState {
  const factory dateListForDateHeadUpdatedState(
          {required final List<Map<String, String>> dateList}) =
      _$dateListForDateHeadUpdatedStateImpl;

  List<Map<String, String>> get dateList;

  /// Create a copy of HabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$dateListForDateHeadUpdatedStateImplCopyWith<
          _$dateListForDateHeadUpdatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
