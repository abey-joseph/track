// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchExpense,
    required TResult Function() addExpense,
    required TResult Function() editExpense,
    required TResult Function() deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchExpense,
    TResult? Function()? addExpense,
    TResult? Function()? editExpense,
    TResult? Function()? deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchExpense,
    TResult Function()? addExpense,
    TResult Function()? editExpense,
    TResult Function()? deleteExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchExpense value) fetchExpense,
    required TResult Function(addExpense value) addExpense,
    required TResult Function(editExpense value) editExpense,
    required TResult Function(deleteExpense value) deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchExpense value)? fetchExpense,
    TResult? Function(addExpense value)? addExpense,
    TResult? Function(editExpense value)? editExpense,
    TResult? Function(deleteExpense value)? deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchExpense value)? fetchExpense,
    TResult Function(addExpense value)? addExpense,
    TResult Function(editExpense value)? editExpense,
    TResult Function(deleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseEventCopyWith<$Res> {
  factory $ExpenseEventCopyWith(
          ExpenseEvent value, $Res Function(ExpenseEvent) then) =
      _$ExpenseEventCopyWithImpl<$Res, ExpenseEvent>;
}

/// @nodoc
class _$ExpenseEventCopyWithImpl<$Res, $Val extends ExpenseEvent>
    implements $ExpenseEventCopyWith<$Res> {
  _$ExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$fetchExpenseImplCopyWith<$Res> {
  factory _$$fetchExpenseImplCopyWith(
          _$fetchExpenseImpl value, $Res Function(_$fetchExpenseImpl) then) =
      __$$fetchExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$fetchExpenseImpl>
    implements _$$fetchExpenseImplCopyWith<$Res> {
  __$$fetchExpenseImplCopyWithImpl(
      _$fetchExpenseImpl _value, $Res Function(_$fetchExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$fetchExpenseImpl implements fetchExpense {
  const _$fetchExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.fetchExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchExpense,
    required TResult Function() addExpense,
    required TResult Function() editExpense,
    required TResult Function() deleteExpense,
  }) {
    return fetchExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchExpense,
    TResult? Function()? addExpense,
    TResult? Function()? editExpense,
    TResult? Function()? deleteExpense,
  }) {
    return fetchExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchExpense,
    TResult Function()? addExpense,
    TResult Function()? editExpense,
    TResult Function()? deleteExpense,
    required TResult orElse(),
  }) {
    if (fetchExpense != null) {
      return fetchExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchExpense value) fetchExpense,
    required TResult Function(addExpense value) addExpense,
    required TResult Function(editExpense value) editExpense,
    required TResult Function(deleteExpense value) deleteExpense,
  }) {
    return fetchExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchExpense value)? fetchExpense,
    TResult? Function(addExpense value)? addExpense,
    TResult? Function(editExpense value)? editExpense,
    TResult? Function(deleteExpense value)? deleteExpense,
  }) {
    return fetchExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchExpense value)? fetchExpense,
    TResult Function(addExpense value)? addExpense,
    TResult Function(editExpense value)? editExpense,
    TResult Function(deleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (fetchExpense != null) {
      return fetchExpense(this);
    }
    return orElse();
  }
}

abstract class fetchExpense implements ExpenseEvent {
  const factory fetchExpense() = _$fetchExpenseImpl;
}

/// @nodoc
abstract class _$$addExpenseImplCopyWith<$Res> {
  factory _$$addExpenseImplCopyWith(
          _$addExpenseImpl value, $Res Function(_$addExpenseImpl) then) =
      __$$addExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$addExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$addExpenseImpl>
    implements _$$addExpenseImplCopyWith<$Res> {
  __$$addExpenseImplCopyWithImpl(
      _$addExpenseImpl _value, $Res Function(_$addExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$addExpenseImpl implements addExpense {
  const _$addExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.addExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$addExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchExpense,
    required TResult Function() addExpense,
    required TResult Function() editExpense,
    required TResult Function() deleteExpense,
  }) {
    return addExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchExpense,
    TResult? Function()? addExpense,
    TResult? Function()? editExpense,
    TResult? Function()? deleteExpense,
  }) {
    return addExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchExpense,
    TResult Function()? addExpense,
    TResult Function()? editExpense,
    TResult Function()? deleteExpense,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchExpense value) fetchExpense,
    required TResult Function(addExpense value) addExpense,
    required TResult Function(editExpense value) editExpense,
    required TResult Function(deleteExpense value) deleteExpense,
  }) {
    return addExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchExpense value)? fetchExpense,
    TResult? Function(addExpense value)? addExpense,
    TResult? Function(editExpense value)? editExpense,
    TResult? Function(deleteExpense value)? deleteExpense,
  }) {
    return addExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchExpense value)? fetchExpense,
    TResult Function(addExpense value)? addExpense,
    TResult Function(editExpense value)? editExpense,
    TResult Function(deleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(this);
    }
    return orElse();
  }
}

abstract class addExpense implements ExpenseEvent {
  const factory addExpense() = _$addExpenseImpl;
}

/// @nodoc
abstract class _$$editExpenseImplCopyWith<$Res> {
  factory _$$editExpenseImplCopyWith(
          _$editExpenseImpl value, $Res Function(_$editExpenseImpl) then) =
      __$$editExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$editExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$editExpenseImpl>
    implements _$$editExpenseImplCopyWith<$Res> {
  __$$editExpenseImplCopyWithImpl(
      _$editExpenseImpl _value, $Res Function(_$editExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$editExpenseImpl implements editExpense {
  const _$editExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.editExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$editExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchExpense,
    required TResult Function() addExpense,
    required TResult Function() editExpense,
    required TResult Function() deleteExpense,
  }) {
    return editExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchExpense,
    TResult? Function()? addExpense,
    TResult? Function()? editExpense,
    TResult? Function()? deleteExpense,
  }) {
    return editExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchExpense,
    TResult Function()? addExpense,
    TResult Function()? editExpense,
    TResult Function()? deleteExpense,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchExpense value) fetchExpense,
    required TResult Function(addExpense value) addExpense,
    required TResult Function(editExpense value) editExpense,
    required TResult Function(deleteExpense value) deleteExpense,
  }) {
    return editExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchExpense value)? fetchExpense,
    TResult? Function(addExpense value)? addExpense,
    TResult? Function(editExpense value)? editExpense,
    TResult? Function(deleteExpense value)? deleteExpense,
  }) {
    return editExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchExpense value)? fetchExpense,
    TResult Function(addExpense value)? addExpense,
    TResult Function(editExpense value)? editExpense,
    TResult Function(deleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(this);
    }
    return orElse();
  }
}

abstract class editExpense implements ExpenseEvent {
  const factory editExpense() = _$editExpenseImpl;
}

/// @nodoc
abstract class _$$deleteExpenseImplCopyWith<$Res> {
  factory _$$deleteExpenseImplCopyWith(
          _$deleteExpenseImpl value, $Res Function(_$deleteExpenseImpl) then) =
      __$$deleteExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$deleteExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseEventCopyWithImpl<$Res, _$deleteExpenseImpl>
    implements _$$deleteExpenseImplCopyWith<$Res> {
  __$$deleteExpenseImplCopyWithImpl(
      _$deleteExpenseImpl _value, $Res Function(_$deleteExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$deleteExpenseImpl implements deleteExpense {
  const _$deleteExpenseImpl();

  @override
  String toString() {
    return 'ExpenseEvent.deleteExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$deleteExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchExpense,
    required TResult Function() addExpense,
    required TResult Function() editExpense,
    required TResult Function() deleteExpense,
  }) {
    return deleteExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchExpense,
    TResult? Function()? addExpense,
    TResult? Function()? editExpense,
    TResult? Function()? deleteExpense,
  }) {
    return deleteExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchExpense,
    TResult Function()? addExpense,
    TResult Function()? editExpense,
    TResult Function()? deleteExpense,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(fetchExpense value) fetchExpense,
    required TResult Function(addExpense value) addExpense,
    required TResult Function(editExpense value) editExpense,
    required TResult Function(deleteExpense value) deleteExpense,
  }) {
    return deleteExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(fetchExpense value)? fetchExpense,
    TResult? Function(addExpense value)? addExpense,
    TResult? Function(editExpense value)? editExpense,
    TResult? Function(deleteExpense value)? deleteExpense,
  }) {
    return deleteExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(fetchExpense value)? fetchExpense,
    TResult Function(addExpense value)? addExpense,
    TResult Function(editExpense value)? editExpense,
    TResult Function(deleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(this);
    }
    return orElse();
  }
}

abstract class deleteExpense implements ExpenseEvent {
  const factory deleteExpense() = _$deleteExpenseImpl;
}

/// @nodoc
mixin _$ExpenseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateCopyWith(
          ExpenseState value, $Res Function(ExpenseState) then) =
      _$ExpenseStateCopyWithImpl<$Res, ExpenseState>;
}

/// @nodoc
class _$ExpenseStateCopyWithImpl<$Res, $Val extends ExpenseState>
    implements $ExpenseStateCopyWith<$Res> {
  _$ExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$expenseInitialImplCopyWith<$Res> {
  factory _$$expenseInitialImplCopyWith(_$expenseInitialImpl value,
          $Res Function(_$expenseInitialImpl) then) =
      __$$expenseInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseInitialImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$expenseInitialImpl>
    implements _$$expenseInitialImplCopyWith<$Res> {
  __$$expenseInitialImplCopyWithImpl(
      _$expenseInitialImpl _value, $Res Function(_$expenseInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseInitialImpl implements expenseInitial {
  const _$expenseInitialImpl();

  @override
  String toString() {
    return 'ExpenseState.expenseInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$expenseInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) {
    return expenseInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) {
    return expenseInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseInitial != null) {
      return expenseInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) {
    return expenseInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) {
    return expenseInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseInitial != null) {
      return expenseInitial(this);
    }
    return orElse();
  }
}

abstract class expenseInitial implements ExpenseState {
  const factory expenseInitial() = _$expenseInitialImpl;
}

/// @nodoc
abstract class _$$expenseFetchedImplCopyWith<$Res> {
  factory _$$expenseFetchedImplCopyWith(_$expenseFetchedImpl value,
          $Res Function(_$expenseFetchedImpl) then) =
      __$$expenseFetchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseFetchedImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$expenseFetchedImpl>
    implements _$$expenseFetchedImplCopyWith<$Res> {
  __$$expenseFetchedImplCopyWithImpl(
      _$expenseFetchedImpl _value, $Res Function(_$expenseFetchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseFetchedImpl implements expenseFetched {
  const _$expenseFetchedImpl();

  @override
  String toString() {
    return 'ExpenseState.expenseFetched()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$expenseFetchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) {
    return expenseFetched();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) {
    return expenseFetched?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseFetched != null) {
      return expenseFetched();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) {
    return expenseFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) {
    return expenseFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseFetched != null) {
      return expenseFetched(this);
    }
    return orElse();
  }
}

abstract class expenseFetched implements ExpenseState {
  const factory expenseFetched() = _$expenseFetchedImpl;
}

/// @nodoc
abstract class _$$expenseAddedImplCopyWith<$Res> {
  factory _$$expenseAddedImplCopyWith(
          _$expenseAddedImpl value, $Res Function(_$expenseAddedImpl) then) =
      __$$expenseAddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseAddedImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$expenseAddedImpl>
    implements _$$expenseAddedImplCopyWith<$Res> {
  __$$expenseAddedImplCopyWithImpl(
      _$expenseAddedImpl _value, $Res Function(_$expenseAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseAddedImpl implements expenseAdded {
  const _$expenseAddedImpl();

  @override
  String toString() {
    return 'ExpenseState.expenseAdded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$expenseAddedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) {
    return expenseAdded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) {
    return expenseAdded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseAdded != null) {
      return expenseAdded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) {
    return expenseAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) {
    return expenseAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseAdded != null) {
      return expenseAdded(this);
    }
    return orElse();
  }
}

abstract class expenseAdded implements ExpenseState {
  const factory expenseAdded() = _$expenseAddedImpl;
}

/// @nodoc
abstract class _$$expenseDeletedImplCopyWith<$Res> {
  factory _$$expenseDeletedImplCopyWith(_$expenseDeletedImpl value,
          $Res Function(_$expenseDeletedImpl) then) =
      __$$expenseDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseDeletedImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$expenseDeletedImpl>
    implements _$$expenseDeletedImplCopyWith<$Res> {
  __$$expenseDeletedImplCopyWithImpl(
      _$expenseDeletedImpl _value, $Res Function(_$expenseDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseDeletedImpl implements expenseDeleted {
  const _$expenseDeletedImpl();

  @override
  String toString() {
    return 'ExpenseState.expenseDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$expenseDeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) {
    return expenseDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) {
    return expenseDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseDeleted != null) {
      return expenseDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) {
    return expenseDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) {
    return expenseDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseDeleted != null) {
      return expenseDeleted(this);
    }
    return orElse();
  }
}

abstract class expenseDeleted implements ExpenseState {
  const factory expenseDeleted() = _$expenseDeletedImpl;
}

/// @nodoc
abstract class _$$expenseEditedImplCopyWith<$Res> {
  factory _$$expenseEditedImplCopyWith(
          _$expenseEditedImpl value, $Res Function(_$expenseEditedImpl) then) =
      __$$expenseEditedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseEditedImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$expenseEditedImpl>
    implements _$$expenseEditedImplCopyWith<$Res> {
  __$$expenseEditedImplCopyWithImpl(
      _$expenseEditedImpl _value, $Res Function(_$expenseEditedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseEditedImpl implements expenseEdited {
  const _$expenseEditedImpl();

  @override
  String toString() {
    return 'ExpenseState.expenseEdited()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$expenseEditedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expenseInitial,
    required TResult Function() expenseFetched,
    required TResult Function() expenseAdded,
    required TResult Function() expenseDeleted,
    required TResult Function() expenseEdited,
  }) {
    return expenseEdited();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expenseInitial,
    TResult? Function()? expenseFetched,
    TResult? Function()? expenseAdded,
    TResult? Function()? expenseDeleted,
    TResult? Function()? expenseEdited,
  }) {
    return expenseEdited?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expenseInitial,
    TResult Function()? expenseFetched,
    TResult Function()? expenseAdded,
    TResult Function()? expenseDeleted,
    TResult Function()? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseEdited != null) {
      return expenseEdited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseInitial value) expenseInitial,
    required TResult Function(expenseFetched value) expenseFetched,
    required TResult Function(expenseAdded value) expenseAdded,
    required TResult Function(expenseDeleted value) expenseDeleted,
    required TResult Function(expenseEdited value) expenseEdited,
  }) {
    return expenseEdited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseInitial value)? expenseInitial,
    TResult? Function(expenseFetched value)? expenseFetched,
    TResult? Function(expenseAdded value)? expenseAdded,
    TResult? Function(expenseDeleted value)? expenseDeleted,
    TResult? Function(expenseEdited value)? expenseEdited,
  }) {
    return expenseEdited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseInitial value)? expenseInitial,
    TResult Function(expenseFetched value)? expenseFetched,
    TResult Function(expenseAdded value)? expenseAdded,
    TResult Function(expenseDeleted value)? expenseDeleted,
    TResult Function(expenseEdited value)? expenseEdited,
    required TResult orElse(),
  }) {
    if (expenseEdited != null) {
      return expenseEdited(this);
    }
    return orElse();
  }
}

abstract class expenseEdited implements ExpenseState {
  const factory expenseEdited() = _$expenseEditedImpl;
}
