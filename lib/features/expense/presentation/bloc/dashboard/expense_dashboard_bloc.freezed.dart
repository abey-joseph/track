// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseDashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) fetchAllSummary,
    required TResult Function(int currentDayCount) clickedDayCountForRecentTxn,
    required TResult Function(int currentAccountID)
        clickedchangeAccountForSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? fetchAllSummary,
    TResult? Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult? Function(int currentAccountID)? clickedchangeAccountForSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? fetchAllSummary,
    TResult Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult Function(int currentAccountID)? clickedchangeAccountForSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllSummary value) fetchAllSummary,
    required TResult Function(_ClickedDayCountForRecentTxn value)
        clickedDayCountForRecentTxn,
    required TResult Function(_ClickedChangeAccountForSummary value)
        clickedchangeAccountForSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllSummary value)? fetchAllSummary,
    TResult? Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult? Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllSummary value)? fetchAllSummary,
    TResult Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDashboardEventCopyWith<$Res> {
  factory $ExpenseDashboardEventCopyWith(ExpenseDashboardEvent value,
          $Res Function(ExpenseDashboardEvent) then) =
      _$ExpenseDashboardEventCopyWithImpl<$Res, ExpenseDashboardEvent>;
}

/// @nodoc
class _$ExpenseDashboardEventCopyWithImpl<$Res,
        $Val extends ExpenseDashboardEvent>
    implements $ExpenseDashboardEventCopyWith<$Res> {
  _$ExpenseDashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchAllSummaryImplCopyWith<$Res> {
  factory _$$FetchAllSummaryImplCopyWith(_$FetchAllSummaryImpl value,
          $Res Function(_$FetchAllSummaryImpl) then) =
      __$$FetchAllSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$FetchAllSummaryImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardEventCopyWithImpl<$Res, _$FetchAllSummaryImpl>
    implements _$$FetchAllSummaryImplCopyWith<$Res> {
  __$$FetchAllSummaryImplCopyWithImpl(
      _$FetchAllSummaryImpl _value, $Res Function(_$FetchAllSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$FetchAllSummaryImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchAllSummaryImpl implements _FetchAllSummary {
  const _$FetchAllSummaryImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ExpenseDashboardEvent.fetchAllSummary(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllSummaryImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllSummaryImplCopyWith<_$FetchAllSummaryImpl> get copyWith =>
      __$$FetchAllSummaryImplCopyWithImpl<_$FetchAllSummaryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) fetchAllSummary,
    required TResult Function(int currentDayCount) clickedDayCountForRecentTxn,
    required TResult Function(int currentAccountID)
        clickedchangeAccountForSummary,
  }) {
    return fetchAllSummary(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? fetchAllSummary,
    TResult? Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult? Function(int currentAccountID)? clickedchangeAccountForSummary,
  }) {
    return fetchAllSummary?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? fetchAllSummary,
    TResult Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult Function(int currentAccountID)? clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (fetchAllSummary != null) {
      return fetchAllSummary(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllSummary value) fetchAllSummary,
    required TResult Function(_ClickedDayCountForRecentTxn value)
        clickedDayCountForRecentTxn,
    required TResult Function(_ClickedChangeAccountForSummary value)
        clickedchangeAccountForSummary,
  }) {
    return fetchAllSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllSummary value)? fetchAllSummary,
    TResult? Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult? Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
  }) {
    return fetchAllSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllSummary value)? fetchAllSummary,
    TResult Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (fetchAllSummary != null) {
      return fetchAllSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchAllSummary implements ExpenseDashboardEvent {
  const factory _FetchAllSummary({required final String uid}) =
      _$FetchAllSummaryImpl;

  String get uid;

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllSummaryImplCopyWith<_$FetchAllSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClickedDayCountForRecentTxnImplCopyWith<$Res> {
  factory _$$ClickedDayCountForRecentTxnImplCopyWith(
          _$ClickedDayCountForRecentTxnImpl value,
          $Res Function(_$ClickedDayCountForRecentTxnImpl) then) =
      __$$ClickedDayCountForRecentTxnImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentDayCount});
}

/// @nodoc
class __$$ClickedDayCountForRecentTxnImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardEventCopyWithImpl<$Res,
        _$ClickedDayCountForRecentTxnImpl>
    implements _$$ClickedDayCountForRecentTxnImplCopyWith<$Res> {
  __$$ClickedDayCountForRecentTxnImplCopyWithImpl(
      _$ClickedDayCountForRecentTxnImpl _value,
      $Res Function(_$ClickedDayCountForRecentTxnImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDayCount = null,
  }) {
    return _then(_$ClickedDayCountForRecentTxnImpl(
      currentDayCount: null == currentDayCount
          ? _value.currentDayCount
          : currentDayCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClickedDayCountForRecentTxnImpl
    implements _ClickedDayCountForRecentTxn {
  const _$ClickedDayCountForRecentTxnImpl({required this.currentDayCount});

  @override
  final int currentDayCount;

  @override
  String toString() {
    return 'ExpenseDashboardEvent.clickedDayCountForRecentTxn(currentDayCount: $currentDayCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClickedDayCountForRecentTxnImpl &&
            (identical(other.currentDayCount, currentDayCount) ||
                other.currentDayCount == currentDayCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentDayCount);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClickedDayCountForRecentTxnImplCopyWith<_$ClickedDayCountForRecentTxnImpl>
      get copyWith => __$$ClickedDayCountForRecentTxnImplCopyWithImpl<
          _$ClickedDayCountForRecentTxnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) fetchAllSummary,
    required TResult Function(int currentDayCount) clickedDayCountForRecentTxn,
    required TResult Function(int currentAccountID)
        clickedchangeAccountForSummary,
  }) {
    return clickedDayCountForRecentTxn(currentDayCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? fetchAllSummary,
    TResult? Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult? Function(int currentAccountID)? clickedchangeAccountForSummary,
  }) {
    return clickedDayCountForRecentTxn?.call(currentDayCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? fetchAllSummary,
    TResult Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult Function(int currentAccountID)? clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (clickedDayCountForRecentTxn != null) {
      return clickedDayCountForRecentTxn(currentDayCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllSummary value) fetchAllSummary,
    required TResult Function(_ClickedDayCountForRecentTxn value)
        clickedDayCountForRecentTxn,
    required TResult Function(_ClickedChangeAccountForSummary value)
        clickedchangeAccountForSummary,
  }) {
    return clickedDayCountForRecentTxn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllSummary value)? fetchAllSummary,
    TResult? Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult? Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
  }) {
    return clickedDayCountForRecentTxn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllSummary value)? fetchAllSummary,
    TResult Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (clickedDayCountForRecentTxn != null) {
      return clickedDayCountForRecentTxn(this);
    }
    return orElse();
  }
}

abstract class _ClickedDayCountForRecentTxn implements ExpenseDashboardEvent {
  const factory _ClickedDayCountForRecentTxn(
      {required final int currentDayCount}) = _$ClickedDayCountForRecentTxnImpl;

  int get currentDayCount;

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClickedDayCountForRecentTxnImplCopyWith<_$ClickedDayCountForRecentTxnImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClickedChangeAccountForSummaryImplCopyWith<$Res> {
  factory _$$ClickedChangeAccountForSummaryImplCopyWith(
          _$ClickedChangeAccountForSummaryImpl value,
          $Res Function(_$ClickedChangeAccountForSummaryImpl) then) =
      __$$ClickedChangeAccountForSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentAccountID});
}

/// @nodoc
class __$$ClickedChangeAccountForSummaryImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardEventCopyWithImpl<$Res,
        _$ClickedChangeAccountForSummaryImpl>
    implements _$$ClickedChangeAccountForSummaryImplCopyWith<$Res> {
  __$$ClickedChangeAccountForSummaryImplCopyWithImpl(
      _$ClickedChangeAccountForSummaryImpl _value,
      $Res Function(_$ClickedChangeAccountForSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentAccountID = null,
  }) {
    return _then(_$ClickedChangeAccountForSummaryImpl(
      currentAccountID: null == currentAccountID
          ? _value.currentAccountID
          : currentAccountID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClickedChangeAccountForSummaryImpl
    implements _ClickedChangeAccountForSummary {
  const _$ClickedChangeAccountForSummaryImpl({required this.currentAccountID});

  @override
  final int currentAccountID;

  @override
  String toString() {
    return 'ExpenseDashboardEvent.clickedchangeAccountForSummary(currentAccountID: $currentAccountID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClickedChangeAccountForSummaryImpl &&
            (identical(other.currentAccountID, currentAccountID) ||
                other.currentAccountID == currentAccountID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentAccountID);

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClickedChangeAccountForSummaryImplCopyWith<
          _$ClickedChangeAccountForSummaryImpl>
      get copyWith => __$$ClickedChangeAccountForSummaryImplCopyWithImpl<
          _$ClickedChangeAccountForSummaryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) fetchAllSummary,
    required TResult Function(int currentDayCount) clickedDayCountForRecentTxn,
    required TResult Function(int currentAccountID)
        clickedchangeAccountForSummary,
  }) {
    return clickedchangeAccountForSummary(currentAccountID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? fetchAllSummary,
    TResult? Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult? Function(int currentAccountID)? clickedchangeAccountForSummary,
  }) {
    return clickedchangeAccountForSummary?.call(currentAccountID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? fetchAllSummary,
    TResult Function(int currentDayCount)? clickedDayCountForRecentTxn,
    TResult Function(int currentAccountID)? clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (clickedchangeAccountForSummary != null) {
      return clickedchangeAccountForSummary(currentAccountID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllSummary value) fetchAllSummary,
    required TResult Function(_ClickedDayCountForRecentTxn value)
        clickedDayCountForRecentTxn,
    required TResult Function(_ClickedChangeAccountForSummary value)
        clickedchangeAccountForSummary,
  }) {
    return clickedchangeAccountForSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllSummary value)? fetchAllSummary,
    TResult? Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult? Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
  }) {
    return clickedchangeAccountForSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllSummary value)? fetchAllSummary,
    TResult Function(_ClickedDayCountForRecentTxn value)?
        clickedDayCountForRecentTxn,
    TResult Function(_ClickedChangeAccountForSummary value)?
        clickedchangeAccountForSummary,
    required TResult orElse(),
  }) {
    if (clickedchangeAccountForSummary != null) {
      return clickedchangeAccountForSummary(this);
    }
    return orElse();
  }
}

abstract class _ClickedChangeAccountForSummary
    implements ExpenseDashboardEvent {
  const factory _ClickedChangeAccountForSummary(
          {required final int currentAccountID}) =
      _$ClickedChangeAccountForSummaryImpl;

  int get currentAccountID;

  /// Create a copy of ExpenseDashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClickedChangeAccountForSummaryImplCopyWith<
          _$ClickedChangeAccountForSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExpenseDashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDashboardStateCopyWith<$Res> {
  factory $ExpenseDashboardStateCopyWith(ExpenseDashboardState value,
          $Res Function(ExpenseDashboardState) then) =
      _$ExpenseDashboardStateCopyWithImpl<$Res, ExpenseDashboardState>;
}

/// @nodoc
class _$ExpenseDashboardStateCopyWithImpl<$Res,
        $Val extends ExpenseDashboardState>
    implements $ExpenseDashboardStateCopyWith<$Res> {
  _$ExpenseDashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$expenseDashboardInitialStateImplCopyWith<$Res> {
  factory _$$expenseDashboardInitialStateImplCopyWith(
          _$expenseDashboardInitialStateImpl value,
          $Res Function(_$expenseDashboardInitialStateImpl) then) =
      __$$expenseDashboardInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseDashboardInitialStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardInitialStateImpl>
    implements _$$expenseDashboardInitialStateImplCopyWith<$Res> {
  __$$expenseDashboardInitialStateImplCopyWithImpl(
      _$expenseDashboardInitialStateImpl _value,
      $Res Function(_$expenseDashboardInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseDashboardInitialStateImpl
    implements expenseDashboardInitialState {
  const _$expenseDashboardInitialStateImpl();

  @override
  String toString() {
    return 'ExpenseDashboardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardInitialState implements ExpenseDashboardState {
  const factory expenseDashboardInitialState() =
      _$expenseDashboardInitialStateImpl;
}

/// @nodoc
abstract class _$$expenseDashboardLoadingStateImplCopyWith<$Res> {
  factory _$$expenseDashboardLoadingStateImplCopyWith(
          _$expenseDashboardLoadingStateImpl value,
          $Res Function(_$expenseDashboardLoadingStateImpl) then) =
      __$$expenseDashboardLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$expenseDashboardLoadingStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardLoadingStateImpl>
    implements _$$expenseDashboardLoadingStateImplCopyWith<$Res> {
  __$$expenseDashboardLoadingStateImplCopyWithImpl(
      _$expenseDashboardLoadingStateImpl _value,
      $Res Function(_$expenseDashboardLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$expenseDashboardLoadingStateImpl
    implements expenseDashboardLoadingState {
  const _$expenseDashboardLoadingStateImpl();

  @override
  String toString() {
    return 'ExpenseDashboardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardLoadingState implements ExpenseDashboardState {
  const factory expenseDashboardLoadingState() =
      _$expenseDashboardLoadingStateImpl;
}

/// @nodoc
abstract class _$$expenseDashboardLoadedStateImplCopyWith<$Res> {
  factory _$$expenseDashboardLoadedStateImplCopyWith(
          _$expenseDashboardLoadedStateImpl value,
          $Res Function(_$expenseDashboardLoadedStateImpl) then) =
      __$$expenseDashboardLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DashboardData data, int currentDayCount, int currentAccountId});
}

/// @nodoc
class __$$expenseDashboardLoadedStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardLoadedStateImpl>
    implements _$$expenseDashboardLoadedStateImplCopyWith<$Res> {
  __$$expenseDashboardLoadedStateImplCopyWithImpl(
      _$expenseDashboardLoadedStateImpl _value,
      $Res Function(_$expenseDashboardLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentDayCount = null,
    Object? currentAccountId = null,
  }) {
    return _then(_$expenseDashboardLoadedStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardData,
      currentDayCount: null == currentDayCount
          ? _value.currentDayCount
          : currentDayCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentAccountId: null == currentAccountId
          ? _value.currentAccountId
          : currentAccountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$expenseDashboardLoadedStateImpl implements expenseDashboardLoadedState {
  const _$expenseDashboardLoadedStateImpl(
      {required this.data,
      this.currentDayCount = 30,
      this.currentAccountId = 1});

  @override
  final DashboardData data;
  @override
  @JsonKey()
  final int currentDayCount;
  @override
  @JsonKey()
  final int currentAccountId;

  @override
  String toString() {
    return 'ExpenseDashboardState.loaded(data: $data, currentDayCount: $currentDayCount, currentAccountId: $currentAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardLoadedStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.currentDayCount, currentDayCount) ||
                other.currentDayCount == currentDayCount) &&
            (identical(other.currentAccountId, currentAccountId) ||
                other.currentAccountId == currentAccountId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, data, currentDayCount, currentAccountId);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$expenseDashboardLoadedStateImplCopyWith<_$expenseDashboardLoadedStateImpl>
      get copyWith => __$$expenseDashboardLoadedStateImplCopyWithImpl<
          _$expenseDashboardLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return loaded(data, currentDayCount, currentAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data, currentDayCount, currentAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, currentDayCount, currentAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardLoadedState implements ExpenseDashboardState {
  const factory expenseDashboardLoadedState(
      {required final DashboardData data,
      final int currentDayCount,
      final int currentAccountId}) = _$expenseDashboardLoadedStateImpl;

  DashboardData get data;
  int get currentDayCount;
  int get currentAccountId;

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$expenseDashboardLoadedStateImplCopyWith<_$expenseDashboardLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$expenseDashboardDayCountChangedStateImplCopyWith<$Res> {
  factory _$$expenseDashboardDayCountChangedStateImplCopyWith(
          _$expenseDashboardDayCountChangedStateImpl value,
          $Res Function(_$expenseDashboardDayCountChangedStateImpl) then) =
      __$$expenseDashboardDayCountChangedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DashboardData data, int newDayCount, int currentAccountId});
}

/// @nodoc
class __$$expenseDashboardDayCountChangedStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardDayCountChangedStateImpl>
    implements _$$expenseDashboardDayCountChangedStateImplCopyWith<$Res> {
  __$$expenseDashboardDayCountChangedStateImplCopyWithImpl(
      _$expenseDashboardDayCountChangedStateImpl _value,
      $Res Function(_$expenseDashboardDayCountChangedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? newDayCount = null,
    Object? currentAccountId = null,
  }) {
    return _then(_$expenseDashboardDayCountChangedStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardData,
      newDayCount: null == newDayCount
          ? _value.newDayCount
          : newDayCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentAccountId: null == currentAccountId
          ? _value.currentAccountId
          : currentAccountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$expenseDashboardDayCountChangedStateImpl
    implements expenseDashboardDayCountChangedState {
  const _$expenseDashboardDayCountChangedStateImpl(
      {required this.data,
      required this.newDayCount,
      this.currentAccountId = 1});

  @override
  final DashboardData data;
  @override
  final int newDayCount;
  @override
  @JsonKey()
  final int currentAccountId;

  @override
  String toString() {
    return 'ExpenseDashboardState.dayCountChanged(data: $data, newDayCount: $newDayCount, currentAccountId: $currentAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardDayCountChangedStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.newDayCount, newDayCount) ||
                other.newDayCount == newDayCount) &&
            (identical(other.currentAccountId, currentAccountId) ||
                other.currentAccountId == currentAccountId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, data, newDayCount, currentAccountId);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$expenseDashboardDayCountChangedStateImplCopyWith<
          _$expenseDashboardDayCountChangedStateImpl>
      get copyWith => __$$expenseDashboardDayCountChangedStateImplCopyWithImpl<
          _$expenseDashboardDayCountChangedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return dayCountChanged(data, newDayCount, currentAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return dayCountChanged?.call(data, newDayCount, currentAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (dayCountChanged != null) {
      return dayCountChanged(data, newDayCount, currentAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return dayCountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return dayCountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (dayCountChanged != null) {
      return dayCountChanged(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardDayCountChangedState
    implements ExpenseDashboardState {
  const factory expenseDashboardDayCountChangedState(
      {required final DashboardData data,
      required final int newDayCount,
      final int currentAccountId}) = _$expenseDashboardDayCountChangedStateImpl;

  DashboardData get data;
  int get newDayCount;
  int get currentAccountId;

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$expenseDashboardDayCountChangedStateImplCopyWith<
          _$expenseDashboardDayCountChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$expenseDashboardAccountChangedStateImplCopyWith<$Res> {
  factory _$$expenseDashboardAccountChangedStateImplCopyWith(
          _$expenseDashboardAccountChangedStateImpl value,
          $Res Function(_$expenseDashboardAccountChangedStateImpl) then) =
      __$$expenseDashboardAccountChangedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DashboardData data, int currentDayCount, int newAccountId});
}

/// @nodoc
class __$$expenseDashboardAccountChangedStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardAccountChangedStateImpl>
    implements _$$expenseDashboardAccountChangedStateImplCopyWith<$Res> {
  __$$expenseDashboardAccountChangedStateImplCopyWithImpl(
      _$expenseDashboardAccountChangedStateImpl _value,
      $Res Function(_$expenseDashboardAccountChangedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentDayCount = null,
    Object? newAccountId = null,
  }) {
    return _then(_$expenseDashboardAccountChangedStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardData,
      currentDayCount: null == currentDayCount
          ? _value.currentDayCount
          : currentDayCount // ignore: cast_nullable_to_non_nullable
              as int,
      newAccountId: null == newAccountId
          ? _value.newAccountId
          : newAccountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$expenseDashboardAccountChangedStateImpl
    implements expenseDashboardAccountChangedState {
  const _$expenseDashboardAccountChangedStateImpl(
      {required this.data,
      this.currentDayCount = 30,
      required this.newAccountId});

  @override
  final DashboardData data;
  @override
  @JsonKey()
  final int currentDayCount;
  @override
  final int newAccountId;

  @override
  String toString() {
    return 'ExpenseDashboardState.accountChanged(data: $data, currentDayCount: $currentDayCount, newAccountId: $newAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardAccountChangedStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.currentDayCount, currentDayCount) ||
                other.currentDayCount == currentDayCount) &&
            (identical(other.newAccountId, newAccountId) ||
                other.newAccountId == newAccountId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, data, currentDayCount, newAccountId);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$expenseDashboardAccountChangedStateImplCopyWith<
          _$expenseDashboardAccountChangedStateImpl>
      get copyWith => __$$expenseDashboardAccountChangedStateImplCopyWithImpl<
          _$expenseDashboardAccountChangedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return accountChanged(data, currentDayCount, newAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return accountChanged?.call(data, currentDayCount, newAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(data, currentDayCount, newAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return accountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return accountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardAccountChangedState
    implements ExpenseDashboardState {
  const factory expenseDashboardAccountChangedState(
          {required final DashboardData data,
          final int currentDayCount,
          required final int newAccountId}) =
      _$expenseDashboardAccountChangedStateImpl;

  DashboardData get data;
  int get currentDayCount;
  int get newAccountId;

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$expenseDashboardAccountChangedStateImplCopyWith<
          _$expenseDashboardAccountChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$expenseDashboardErrorStateImplCopyWith<$Res> {
  factory _$$expenseDashboardErrorStateImplCopyWith(
          _$expenseDashboardErrorStateImpl value,
          $Res Function(_$expenseDashboardErrorStateImpl) then) =
      __$$expenseDashboardErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$expenseDashboardErrorStateImplCopyWithImpl<$Res>
    extends _$ExpenseDashboardStateCopyWithImpl<$Res,
        _$expenseDashboardErrorStateImpl>
    implements _$$expenseDashboardErrorStateImplCopyWith<$Res> {
  __$$expenseDashboardErrorStateImplCopyWithImpl(
      _$expenseDashboardErrorStateImpl _value,
      $Res Function(_$expenseDashboardErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$expenseDashboardErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$expenseDashboardErrorStateImpl implements expenseDashboardErrorState {
  const _$expenseDashboardErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ExpenseDashboardState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$expenseDashboardErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$expenseDashboardErrorStateImplCopyWith<_$expenseDashboardErrorStateImpl>
      get copyWith => __$$expenseDashboardErrorStateImplCopyWithImpl<
          _$expenseDashboardErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)
        loaded,
    required TResult Function(
            DashboardData data, int newDayCount, int currentAccountId)
        dayCountChanged,
    required TResult Function(
            DashboardData data, int currentDayCount, int newAccountId)
        accountChanged,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult? Function(
            DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult? Function(
            DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardData data, int currentDayCount, int currentAccountId)?
        loaded,
    TResult Function(DashboardData data, int newDayCount, int currentAccountId)?
        dayCountChanged,
    TResult Function(DashboardData data, int currentDayCount, int newAccountId)?
        accountChanged,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(expenseDashboardInitialState value) initial,
    required TResult Function(expenseDashboardLoadingState value) loading,
    required TResult Function(expenseDashboardLoadedState value) loaded,
    required TResult Function(expenseDashboardDayCountChangedState value)
        dayCountChanged,
    required TResult Function(expenseDashboardAccountChangedState value)
        accountChanged,
    required TResult Function(expenseDashboardErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(expenseDashboardInitialState value)? initial,
    TResult? Function(expenseDashboardLoadingState value)? loading,
    TResult? Function(expenseDashboardLoadedState value)? loaded,
    TResult? Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult? Function(expenseDashboardAccountChangedState value)?
        accountChanged,
    TResult? Function(expenseDashboardErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(expenseDashboardInitialState value)? initial,
    TResult Function(expenseDashboardLoadingState value)? loading,
    TResult Function(expenseDashboardLoadedState value)? loaded,
    TResult Function(expenseDashboardDayCountChangedState value)?
        dayCountChanged,
    TResult Function(expenseDashboardAccountChangedState value)? accountChanged,
    TResult Function(expenseDashboardErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class expenseDashboardErrorState implements ExpenseDashboardState {
  const factory expenseDashboardErrorState({required final String message}) =
      _$expenseDashboardErrorStateImpl;

  String get message;

  /// Create a copy of ExpenseDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$expenseDashboardErrorStateImplCopyWith<_$expenseDashboardErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
