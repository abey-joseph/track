// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) started,
    required TResult Function(AccountFilter filter) filterChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? started,
    TResult? Function(AccountFilter filter)? filterChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? started,
    TResult Function(AccountFilter filter)? filterChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsStarted value) started,
    required TResult Function(_AccountDetailsFilterChanged value) filterChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsStarted value)? started,
    TResult? Function(_AccountDetailsFilterChanged value)? filterChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsStarted value)? started,
    TResult Function(_AccountDetailsFilterChanged value)? filterChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsEventCopyWith<$Res> {
  factory $AccountDetailsEventCopyWith(
          AccountDetailsEvent value, $Res Function(AccountDetailsEvent) then) =
      _$AccountDetailsEventCopyWithImpl<$Res, AccountDetailsEvent>;
}

/// @nodoc
class _$AccountDetailsEventCopyWithImpl<$Res, $Val extends AccountDetailsEvent>
    implements $AccountDetailsEventCopyWith<$Res> {
  _$AccountDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountDetailsStartedImplCopyWith<$Res> {
  factory _$$AccountDetailsStartedImplCopyWith(
          _$AccountDetailsStartedImpl value,
          $Res Function(_$AccountDetailsStartedImpl) then) =
      __$$AccountDetailsStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountId});
}

/// @nodoc
class __$$AccountDetailsStartedImplCopyWithImpl<$Res>
    extends _$AccountDetailsEventCopyWithImpl<$Res, _$AccountDetailsStartedImpl>
    implements _$$AccountDetailsStartedImplCopyWith<$Res> {
  __$$AccountDetailsStartedImplCopyWithImpl(_$AccountDetailsStartedImpl _value,
      $Res Function(_$AccountDetailsStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
  }) {
    return _then(_$AccountDetailsStartedImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccountDetailsStartedImpl implements _AccountDetailsStarted {
  const _$AccountDetailsStartedImpl({required this.accountId});

  @override
  final int accountId;

  @override
  String toString() {
    return 'AccountDetailsEvent.started(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsStartedImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailsStartedImplCopyWith<_$AccountDetailsStartedImpl>
      get copyWith => __$$AccountDetailsStartedImplCopyWithImpl<
          _$AccountDetailsStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) started,
    required TResult Function(AccountFilter filter) filterChanged,
  }) {
    return started(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? started,
    TResult? Function(AccountFilter filter)? filterChanged,
  }) {
    return started?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? started,
    TResult Function(AccountFilter filter)? filterChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsStarted value) started,
    required TResult Function(_AccountDetailsFilterChanged value) filterChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsStarted value)? started,
    TResult? Function(_AccountDetailsFilterChanged value)? filterChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsStarted value)? started,
    TResult Function(_AccountDetailsFilterChanged value)? filterChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsStarted implements AccountDetailsEvent {
  const factory _AccountDetailsStarted({required final int accountId}) =
      _$AccountDetailsStartedImpl;

  int get accountId;

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDetailsStartedImplCopyWith<_$AccountDetailsStartedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountDetailsFilterChangedImplCopyWith<$Res> {
  factory _$$AccountDetailsFilterChangedImplCopyWith(
          _$AccountDetailsFilterChangedImpl value,
          $Res Function(_$AccountDetailsFilterChangedImpl) then) =
      __$$AccountDetailsFilterChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountFilter filter});
}

/// @nodoc
class __$$AccountDetailsFilterChangedImplCopyWithImpl<$Res>
    extends _$AccountDetailsEventCopyWithImpl<$Res,
        _$AccountDetailsFilterChangedImpl>
    implements _$$AccountDetailsFilterChangedImplCopyWith<$Res> {
  __$$AccountDetailsFilterChangedImplCopyWithImpl(
      _$AccountDetailsFilterChangedImpl _value,
      $Res Function(_$AccountDetailsFilterChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$AccountDetailsFilterChangedImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as AccountFilter,
    ));
  }
}

/// @nodoc

class _$AccountDetailsFilterChangedImpl
    implements _AccountDetailsFilterChanged {
  const _$AccountDetailsFilterChangedImpl({required this.filter});

  @override
  final AccountFilter filter;

  @override
  String toString() {
    return 'AccountDetailsEvent.filterChanged(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsFilterChangedImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailsFilterChangedImplCopyWith<_$AccountDetailsFilterChangedImpl>
      get copyWith => __$$AccountDetailsFilterChangedImplCopyWithImpl<
          _$AccountDetailsFilterChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int accountId) started,
    required TResult Function(AccountFilter filter) filterChanged,
  }) {
    return filterChanged(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int accountId)? started,
    TResult? Function(AccountFilter filter)? filterChanged,
  }) {
    return filterChanged?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int accountId)? started,
    TResult Function(AccountFilter filter)? filterChanged,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsStarted value) started,
    required TResult Function(_AccountDetailsFilterChanged value) filterChanged,
  }) {
    return filterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsStarted value)? started,
    TResult? Function(_AccountDetailsFilterChanged value)? filterChanged,
  }) {
    return filterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsStarted value)? started,
    TResult Function(_AccountDetailsFilterChanged value)? filterChanged,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsFilterChanged implements AccountDetailsEvent {
  const factory _AccountDetailsFilterChanged(
          {required final AccountFilter filter}) =
      _$AccountDetailsFilterChangedImpl;

  AccountFilter get filter;

  /// Create a copy of AccountDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDetailsFilterChangedImplCopyWith<_$AccountDetailsFilterChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)
        loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsInitial value) initial,
    required TResult Function(_AccountDetailsLoading value) loading,
    required TResult Function(_AccountDetailsLoaded value) loaded,
    required TResult Function(_AccountDetailsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsInitial value)? initial,
    TResult? Function(_AccountDetailsLoading value)? loading,
    TResult? Function(_AccountDetailsLoaded value)? loaded,
    TResult? Function(_AccountDetailsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsInitial value)? initial,
    TResult Function(_AccountDetailsLoading value)? loading,
    TResult Function(_AccountDetailsLoaded value)? loaded,
    TResult Function(_AccountDetailsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailsStateCopyWith<$Res> {
  factory $AccountDetailsStateCopyWith(
          AccountDetailsState value, $Res Function(AccountDetailsState) then) =
      _$AccountDetailsStateCopyWithImpl<$Res, AccountDetailsState>;
}

/// @nodoc
class _$AccountDetailsStateCopyWithImpl<$Res, $Val extends AccountDetailsState>
    implements $AccountDetailsStateCopyWith<$Res> {
  _$AccountDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountDetailsInitialImplCopyWith<$Res> {
  factory _$$AccountDetailsInitialImplCopyWith(
          _$AccountDetailsInitialImpl value,
          $Res Function(_$AccountDetailsInitialImpl) then) =
      __$$AccountDetailsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountDetailsInitialImplCopyWithImpl<$Res>
    extends _$AccountDetailsStateCopyWithImpl<$Res, _$AccountDetailsInitialImpl>
    implements _$$AccountDetailsInitialImplCopyWith<$Res> {
  __$$AccountDetailsInitialImplCopyWithImpl(_$AccountDetailsInitialImpl _value,
      $Res Function(_$AccountDetailsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountDetailsInitialImpl implements _AccountDetailsInitial {
  const _$AccountDetailsInitialImpl();

  @override
  String toString() {
    return 'AccountDetailsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult Function(String message)? failure,
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
    required TResult Function(_AccountDetailsInitial value) initial,
    required TResult Function(_AccountDetailsLoading value) loading,
    required TResult Function(_AccountDetailsLoaded value) loaded,
    required TResult Function(_AccountDetailsFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsInitial value)? initial,
    TResult? Function(_AccountDetailsLoading value)? loading,
    TResult? Function(_AccountDetailsLoaded value)? loaded,
    TResult? Function(_AccountDetailsFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsInitial value)? initial,
    TResult Function(_AccountDetailsLoading value)? loading,
    TResult Function(_AccountDetailsLoaded value)? loaded,
    TResult Function(_AccountDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsInitial implements AccountDetailsState {
  const factory _AccountDetailsInitial() = _$AccountDetailsInitialImpl;
}

/// @nodoc
abstract class _$$AccountDetailsLoadingImplCopyWith<$Res> {
  factory _$$AccountDetailsLoadingImplCopyWith(
          _$AccountDetailsLoadingImpl value,
          $Res Function(_$AccountDetailsLoadingImpl) then) =
      __$$AccountDetailsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountDetailsLoadingImplCopyWithImpl<$Res>
    extends _$AccountDetailsStateCopyWithImpl<$Res, _$AccountDetailsLoadingImpl>
    implements _$$AccountDetailsLoadingImplCopyWith<$Res> {
  __$$AccountDetailsLoadingImplCopyWithImpl(_$AccountDetailsLoadingImpl _value,
      $Res Function(_$AccountDetailsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountDetailsLoadingImpl implements _AccountDetailsLoading {
  const _$AccountDetailsLoadingImpl();

  @override
  String toString() {
    return 'AccountDetailsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult Function(String message)? failure,
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
    required TResult Function(_AccountDetailsInitial value) initial,
    required TResult Function(_AccountDetailsLoading value) loading,
    required TResult Function(_AccountDetailsLoaded value) loaded,
    required TResult Function(_AccountDetailsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsInitial value)? initial,
    TResult? Function(_AccountDetailsLoading value)? loading,
    TResult? Function(_AccountDetailsLoaded value)? loaded,
    TResult? Function(_AccountDetailsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsInitial value)? initial,
    TResult Function(_AccountDetailsLoading value)? loading,
    TResult Function(_AccountDetailsLoaded value)? loaded,
    TResult Function(_AccountDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsLoading implements AccountDetailsState {
  const factory _AccountDetailsLoading() = _$AccountDetailsLoadingImpl;
}

/// @nodoc
abstract class _$$AccountDetailsLoadedImplCopyWith<$Res> {
  factory _$$AccountDetailsLoadedImplCopyWith(_$AccountDetailsLoadedImpl value,
          $Res Function(_$AccountDetailsLoadedImpl) then) =
      __$$AccountDetailsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AccountEntity account,
      AccountFilter filter,
      AccountTotals totals,
      AccountCounts counts,
      DonutChartData donutData,
      Map<DateTime, List<TransactionEntity>> groupedTransactions,
      List<TransactionEntity> allTransactions});
}

/// @nodoc
class __$$AccountDetailsLoadedImplCopyWithImpl<$Res>
    extends _$AccountDetailsStateCopyWithImpl<$Res, _$AccountDetailsLoadedImpl>
    implements _$$AccountDetailsLoadedImplCopyWith<$Res> {
  __$$AccountDetailsLoadedImplCopyWithImpl(_$AccountDetailsLoadedImpl _value,
      $Res Function(_$AccountDetailsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? filter = null,
    Object? totals = null,
    Object? counts = null,
    Object? donutData = null,
    Object? groupedTransactions = null,
    Object? allTransactions = null,
  }) {
    return _then(_$AccountDetailsLoadedImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as AccountFilter,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as AccountTotals,
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as AccountCounts,
      donutData: null == donutData
          ? _value.donutData
          : donutData // ignore: cast_nullable_to_non_nullable
              as DonutChartData,
      groupedTransactions: null == groupedTransactions
          ? _value._groupedTransactions
          : groupedTransactions // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<TransactionEntity>>,
      allTransactions: null == allTransactions
          ? _value._allTransactions
          : allTransactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$AccountDetailsLoadedImpl implements _AccountDetailsLoaded {
  const _$AccountDetailsLoadedImpl(
      {required this.account,
      required this.filter,
      required this.totals,
      required this.counts,
      required this.donutData,
      required final Map<DateTime, List<TransactionEntity>> groupedTransactions,
      final List<TransactionEntity> allTransactions = const []})
      : _groupedTransactions = groupedTransactions,
        _allTransactions = allTransactions;

  @override
  final AccountEntity account;
  @override
  final AccountFilter filter;
  @override
  final AccountTotals totals;
  @override
  final AccountCounts counts;
  @override
  final DonutChartData donutData;
  final Map<DateTime, List<TransactionEntity>> _groupedTransactions;
  @override
  Map<DateTime, List<TransactionEntity>> get groupedTransactions {
    if (_groupedTransactions is EqualUnmodifiableMapView)
      return _groupedTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groupedTransactions);
  }

  final List<TransactionEntity> _allTransactions;
  @override
  @JsonKey()
  List<TransactionEntity> get allTransactions {
    if (_allTransactions is EqualUnmodifiableListView) return _allTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTransactions);
  }

  @override
  String toString() {
    return 'AccountDetailsState.loaded(account: $account, filter: $filter, totals: $totals, counts: $counts, donutData: $donutData, groupedTransactions: $groupedTransactions, allTransactions: $allTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsLoadedImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.totals, totals) || other.totals == totals) &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.donutData, donutData) ||
                other.donutData == donutData) &&
            const DeepCollectionEquality()
                .equals(other._groupedTransactions, _groupedTransactions) &&
            const DeepCollectionEquality()
                .equals(other._allTransactions, _allTransactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      account,
      filter,
      totals,
      counts,
      donutData,
      const DeepCollectionEquality().hash(_groupedTransactions),
      const DeepCollectionEquality().hash(_allTransactions));

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailsLoadedImplCopyWith<_$AccountDetailsLoadedImpl>
      get copyWith =>
          __$$AccountDetailsLoadedImplCopyWithImpl<_$AccountDetailsLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(account, filter, totals, counts, donutData,
        groupedTransactions, allTransactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(account, filter, totals, counts, donutData,
        groupedTransactions, allTransactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(account, filter, totals, counts, donutData,
          groupedTransactions, allTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsInitial value) initial,
    required TResult Function(_AccountDetailsLoading value) loading,
    required TResult Function(_AccountDetailsLoaded value) loaded,
    required TResult Function(_AccountDetailsFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsInitial value)? initial,
    TResult? Function(_AccountDetailsLoading value)? loading,
    TResult? Function(_AccountDetailsLoaded value)? loaded,
    TResult? Function(_AccountDetailsFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsInitial value)? initial,
    TResult Function(_AccountDetailsLoading value)? loading,
    TResult Function(_AccountDetailsLoaded value)? loaded,
    TResult Function(_AccountDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsLoaded implements AccountDetailsState {
  const factory _AccountDetailsLoaded(
      {required final AccountEntity account,
      required final AccountFilter filter,
      required final AccountTotals totals,
      required final AccountCounts counts,
      required final DonutChartData donutData,
      required final Map<DateTime, List<TransactionEntity>> groupedTransactions,
      final List<TransactionEntity>
          allTransactions}) = _$AccountDetailsLoadedImpl;

  AccountEntity get account;
  AccountFilter get filter;
  AccountTotals get totals;
  AccountCounts get counts;
  DonutChartData get donutData;
  Map<DateTime, List<TransactionEntity>> get groupedTransactions;
  List<TransactionEntity> get allTransactions;

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDetailsLoadedImplCopyWith<_$AccountDetailsLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountDetailsFailureImplCopyWith<$Res> {
  factory _$$AccountDetailsFailureImplCopyWith(
          _$AccountDetailsFailureImpl value,
          $Res Function(_$AccountDetailsFailureImpl) then) =
      __$$AccountDetailsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountDetailsFailureImplCopyWithImpl<$Res>
    extends _$AccountDetailsStateCopyWithImpl<$Res, _$AccountDetailsFailureImpl>
    implements _$$AccountDetailsFailureImplCopyWith<$Res> {
  __$$AccountDetailsFailureImplCopyWithImpl(_$AccountDetailsFailureImpl _value,
      $Res Function(_$AccountDetailsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccountDetailsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountDetailsFailureImpl implements _AccountDetailsFailure {
  const _$AccountDetailsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountDetailsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailsFailureImplCopyWith<_$AccountDetailsFailureImpl>
      get copyWith => __$$AccountDetailsFailureImplCopyWithImpl<
          _$AccountDetailsFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            AccountEntity account,
            AccountFilter filter,
            AccountTotals totals,
            AccountCounts counts,
            DonutChartData donutData,
            Map<DateTime, List<TransactionEntity>> groupedTransactions,
            List<TransactionEntity> allTransactions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountDetailsInitial value) initial,
    required TResult Function(_AccountDetailsLoading value) loading,
    required TResult Function(_AccountDetailsLoaded value) loaded,
    required TResult Function(_AccountDetailsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountDetailsInitial value)? initial,
    TResult? Function(_AccountDetailsLoading value)? loading,
    TResult? Function(_AccountDetailsLoaded value)? loaded,
    TResult? Function(_AccountDetailsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountDetailsInitial value)? initial,
    TResult Function(_AccountDetailsLoading value)? loading,
    TResult Function(_AccountDetailsLoaded value)? loaded,
    TResult Function(_AccountDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AccountDetailsFailure implements AccountDetailsState {
  const factory _AccountDetailsFailure(final String message) =
      _$AccountDetailsFailureImpl;

  String get message;

  /// Create a copy of AccountDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDetailsFailureImplCopyWith<_$AccountDetailsFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
