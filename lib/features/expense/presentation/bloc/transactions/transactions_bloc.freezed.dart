// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, DateTime? from, DateTime? to) load,
    required TResult Function(TransactionEntity transaction) add,
    required TResult Function(TransactionEntity transaction) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, DateTime? from, DateTime? to)? load,
    TResult? Function(TransactionEntity transaction)? add,
    TResult? Function(TransactionEntity transaction)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, DateTime? from, DateTime? to)? load,
    TResult Function(TransactionEntity transaction)? add,
    TResult Function(TransactionEntity transaction)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsLoad value) load,
    required TResult Function(_TransactionsAdd value) add,
    required TResult Function(_TransactionsUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsLoad value)? load,
    TResult? Function(_TransactionsAdd value)? add,
    TResult? Function(_TransactionsUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsLoad value)? load,
    TResult Function(_TransactionsAdd value)? add,
    TResult Function(_TransactionsUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsEventCopyWith<$Res> {
  factory $TransactionsEventCopyWith(
          TransactionsEvent value, $Res Function(TransactionsEvent) then) =
      _$TransactionsEventCopyWithImpl<$Res, TransactionsEvent>;
}

/// @nodoc
class _$TransactionsEventCopyWithImpl<$Res, $Val extends TransactionsEvent>
    implements $TransactionsEventCopyWith<$Res> {
  _$TransactionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TransactionsLoadImplCopyWith<$Res> {
  factory _$$TransactionsLoadImplCopyWith(_$TransactionsLoadImpl value,
          $Res Function(_$TransactionsLoadImpl) then) =
      __$$TransactionsLoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid, DateTime? from, DateTime? to});
}

/// @nodoc
class __$$TransactionsLoadImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsLoadImpl>
    implements _$$TransactionsLoadImplCopyWith<$Res> {
  __$$TransactionsLoadImplCopyWithImpl(_$TransactionsLoadImpl _value,
      $Res Function(_$TransactionsLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$TransactionsLoadImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TransactionsLoadImpl implements _TransactionsLoad {
  const _$TransactionsLoadImpl({required this.uid, this.from, this.to});

  @override
  final String uid;
  @override
  final DateTime? from;
  @override
  final DateTime? to;

  @override
  String toString() {
    return 'TransactionsEvent.load(uid: $uid, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, from, to);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsLoadImplCopyWith<_$TransactionsLoadImpl> get copyWith =>
      __$$TransactionsLoadImplCopyWithImpl<_$TransactionsLoadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, DateTime? from, DateTime? to) load,
    required TResult Function(TransactionEntity transaction) add,
    required TResult Function(TransactionEntity transaction) update,
  }) {
    return load(uid, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, DateTime? from, DateTime? to)? load,
    TResult? Function(TransactionEntity transaction)? add,
    TResult? Function(TransactionEntity transaction)? update,
  }) {
    return load?.call(uid, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, DateTime? from, DateTime? to)? load,
    TResult Function(TransactionEntity transaction)? add,
    TResult Function(TransactionEntity transaction)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(uid, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsLoad value) load,
    required TResult Function(_TransactionsAdd value) add,
    required TResult Function(_TransactionsUpdate value) update,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsLoad value)? load,
    TResult? Function(_TransactionsAdd value)? add,
    TResult? Function(_TransactionsUpdate value)? update,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsLoad value)? load,
    TResult Function(_TransactionsAdd value)? add,
    TResult Function(_TransactionsUpdate value)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _TransactionsLoad implements TransactionsEvent {
  const factory _TransactionsLoad(
      {required final String uid,
      final DateTime? from,
      final DateTime? to}) = _$TransactionsLoadImpl;

  String get uid;
  DateTime? get from;
  DateTime? get to;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsLoadImplCopyWith<_$TransactionsLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsAddImplCopyWith<$Res> {
  factory _$$TransactionsAddImplCopyWith(_$TransactionsAddImpl value,
          $Res Function(_$TransactionsAddImpl) then) =
      __$$TransactionsAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity transaction});
}

/// @nodoc
class __$$TransactionsAddImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsAddImpl>
    implements _$$TransactionsAddImplCopyWith<$Res> {
  __$$TransactionsAddImplCopyWithImpl(
      _$TransactionsAddImpl _value, $Res Function(_$TransactionsAddImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$TransactionsAddImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$TransactionsAddImpl implements _TransactionsAdd {
  const _$TransactionsAddImpl({required this.transaction});

  @override
  final TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionsEvent.add(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsAddImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsAddImplCopyWith<_$TransactionsAddImpl> get copyWith =>
      __$$TransactionsAddImplCopyWithImpl<_$TransactionsAddImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, DateTime? from, DateTime? to) load,
    required TResult Function(TransactionEntity transaction) add,
    required TResult Function(TransactionEntity transaction) update,
  }) {
    return add(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, DateTime? from, DateTime? to)? load,
    TResult? Function(TransactionEntity transaction)? add,
    TResult? Function(TransactionEntity transaction)? update,
  }) {
    return add?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, DateTime? from, DateTime? to)? load,
    TResult Function(TransactionEntity transaction)? add,
    TResult Function(TransactionEntity transaction)? update,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsLoad value) load,
    required TResult Function(_TransactionsAdd value) add,
    required TResult Function(_TransactionsUpdate value) update,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsLoad value)? load,
    TResult? Function(_TransactionsAdd value)? add,
    TResult? Function(_TransactionsUpdate value)? update,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsLoad value)? load,
    TResult Function(_TransactionsAdd value)? add,
    TResult Function(_TransactionsUpdate value)? update,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _TransactionsAdd implements TransactionsEvent {
  const factory _TransactionsAdd(
      {required final TransactionEntity transaction}) = _$TransactionsAddImpl;

  TransactionEntity get transaction;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsAddImplCopyWith<_$TransactionsAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsUpdateImplCopyWith<$Res> {
  factory _$$TransactionsUpdateImplCopyWith(_$TransactionsUpdateImpl value,
          $Res Function(_$TransactionsUpdateImpl) then) =
      __$$TransactionsUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionEntity transaction});
}

/// @nodoc
class __$$TransactionsUpdateImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsUpdateImpl>
    implements _$$TransactionsUpdateImplCopyWith<$Res> {
  __$$TransactionsUpdateImplCopyWithImpl(_$TransactionsUpdateImpl _value,
      $Res Function(_$TransactionsUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$TransactionsUpdateImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionEntity,
    ));
  }
}

/// @nodoc

class _$TransactionsUpdateImpl implements _TransactionsUpdate {
  const _$TransactionsUpdateImpl({required this.transaction});

  @override
  final TransactionEntity transaction;

  @override
  String toString() {
    return 'TransactionsEvent.update(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsUpdateImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsUpdateImplCopyWith<_$TransactionsUpdateImpl> get copyWith =>
      __$$TransactionsUpdateImplCopyWithImpl<_$TransactionsUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, DateTime? from, DateTime? to) load,
    required TResult Function(TransactionEntity transaction) add,
    required TResult Function(TransactionEntity transaction) update,
  }) {
    return update(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, DateTime? from, DateTime? to)? load,
    TResult? Function(TransactionEntity transaction)? add,
    TResult? Function(TransactionEntity transaction)? update,
  }) {
    return update?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, DateTime? from, DateTime? to)? load,
    TResult Function(TransactionEntity transaction)? add,
    TResult Function(TransactionEntity transaction)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsLoad value) load,
    required TResult Function(_TransactionsAdd value) add,
    required TResult Function(_TransactionsUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsLoad value)? load,
    TResult? Function(_TransactionsAdd value)? add,
    TResult? Function(_TransactionsUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsLoad value)? load,
    TResult Function(_TransactionsAdd value)? add,
    TResult Function(_TransactionsUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _TransactionsUpdate implements TransactionsEvent {
  const factory _TransactionsUpdate(
          {required final TransactionEntity transaction}) =
      _$TransactionsUpdateImpl;

  TransactionEntity get transaction;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsUpdateImplCopyWith<_$TransactionsUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsInitial value) initial,
    required TResult Function(_TransactionsLoading value) loading,
    required TResult Function(_TransactionsLoaded value) loaded,
    required TResult Function(_TransactionsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsInitial value)? initial,
    TResult? Function(_TransactionsLoading value)? loading,
    TResult? Function(_TransactionsLoaded value)? loaded,
    TResult? Function(_TransactionsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsInitial value)? initial,
    TResult Function(_TransactionsLoading value)? loading,
    TResult Function(_TransactionsLoaded value)? loaded,
    TResult Function(_TransactionsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TransactionsInitialImplCopyWith<$Res> {
  factory _$$TransactionsInitialImplCopyWith(_$TransactionsInitialImpl value,
          $Res Function(_$TransactionsInitialImpl) then) =
      __$$TransactionsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsInitialImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsInitialImpl>
    implements _$$TransactionsInitialImplCopyWith<$Res> {
  __$$TransactionsInitialImplCopyWithImpl(_$TransactionsInitialImpl _value,
      $Res Function(_$TransactionsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransactionsInitialImpl implements _TransactionsInitial {
  const _$TransactionsInitialImpl();

  @override
  String toString() {
    return 'TransactionsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
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
    required TResult Function(_TransactionsInitial value) initial,
    required TResult Function(_TransactionsLoading value) loading,
    required TResult Function(_TransactionsLoaded value) loaded,
    required TResult Function(_TransactionsFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsInitial value)? initial,
    TResult? Function(_TransactionsLoading value)? loading,
    TResult? Function(_TransactionsLoaded value)? loaded,
    TResult? Function(_TransactionsFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsInitial value)? initial,
    TResult Function(_TransactionsLoading value)? loading,
    TResult Function(_TransactionsLoaded value)? loaded,
    TResult Function(_TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TransactionsInitial implements TransactionsState {
  const factory _TransactionsInitial() = _$TransactionsInitialImpl;
}

/// @nodoc
abstract class _$$TransactionsLoadingImplCopyWith<$Res> {
  factory _$$TransactionsLoadingImplCopyWith(_$TransactionsLoadingImpl value,
          $Res Function(_$TransactionsLoadingImpl) then) =
      __$$TransactionsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsLoadingImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsLoadingImpl>
    implements _$$TransactionsLoadingImplCopyWith<$Res> {
  __$$TransactionsLoadingImplCopyWithImpl(_$TransactionsLoadingImpl _value,
      $Res Function(_$TransactionsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransactionsLoadingImpl implements _TransactionsLoading {
  const _$TransactionsLoadingImpl();

  @override
  String toString() {
    return 'TransactionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
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
    required TResult Function(_TransactionsInitial value) initial,
    required TResult Function(_TransactionsLoading value) loading,
    required TResult Function(_TransactionsLoaded value) loaded,
    required TResult Function(_TransactionsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsInitial value)? initial,
    TResult? Function(_TransactionsLoading value)? loading,
    TResult? Function(_TransactionsLoaded value)? loaded,
    TResult? Function(_TransactionsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsInitial value)? initial,
    TResult Function(_TransactionsLoading value)? loading,
    TResult Function(_TransactionsLoaded value)? loaded,
    TResult Function(_TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TransactionsLoading implements TransactionsState {
  const factory _TransactionsLoading() = _$TransactionsLoadingImpl;
}

/// @nodoc
abstract class _$$TransactionsLoadedImplCopyWith<$Res> {
  factory _$$TransactionsLoadedImplCopyWith(_$TransactionsLoadedImpl value,
          $Res Function(_$TransactionsLoadedImpl) then) =
      __$$TransactionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionEntity> transactions});
}

/// @nodoc
class __$$TransactionsLoadedImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsLoadedImpl>
    implements _$$TransactionsLoadedImplCopyWith<$Res> {
  __$$TransactionsLoadedImplCopyWithImpl(_$TransactionsLoadedImpl _value,
      $Res Function(_$TransactionsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionsLoadedImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionsLoadedImpl implements _TransactionsLoaded {
  const _$TransactionsLoadedImpl(final List<TransactionEntity> transactions)
      : _transactions = transactions;

  final List<TransactionEntity> _transactions;
  @override
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionsState.loaded(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      __$$TransactionsLoadedImplCopyWithImpl<_$TransactionsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionsInitial value) initial,
    required TResult Function(_TransactionsLoading value) loading,
    required TResult Function(_TransactionsLoaded value) loaded,
    required TResult Function(_TransactionsFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsInitial value)? initial,
    TResult? Function(_TransactionsLoading value)? loading,
    TResult? Function(_TransactionsLoaded value)? loaded,
    TResult? Function(_TransactionsFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsInitial value)? initial,
    TResult Function(_TransactionsLoading value)? loading,
    TResult Function(_TransactionsLoaded value)? loaded,
    TResult Function(_TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _TransactionsLoaded implements TransactionsState {
  const factory _TransactionsLoaded(
      final List<TransactionEntity> transactions) = _$TransactionsLoadedImpl;

  List<TransactionEntity> get transactions;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsFailureImplCopyWith<$Res> {
  factory _$$TransactionsFailureImplCopyWith(_$TransactionsFailureImpl value,
          $Res Function(_$TransactionsFailureImpl) then) =
      __$$TransactionsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionsFailureImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsFailureImpl>
    implements _$$TransactionsFailureImplCopyWith<$Res> {
  __$$TransactionsFailureImplCopyWithImpl(_$TransactionsFailureImpl _value,
      $Res Function(_$TransactionsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionsFailureImpl implements _TransactionsFailure {
  const _$TransactionsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsFailureImplCopyWith<_$TransactionsFailureImpl> get copyWith =>
      __$$TransactionsFailureImplCopyWithImpl<_$TransactionsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionEntity> transactions) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionEntity> transactions)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionEntity> transactions)? loaded,
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
    required TResult Function(_TransactionsInitial value) initial,
    required TResult Function(_TransactionsLoading value) loading,
    required TResult Function(_TransactionsLoaded value) loaded,
    required TResult Function(_TransactionsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionsInitial value)? initial,
    TResult? Function(_TransactionsLoading value)? loading,
    TResult? Function(_TransactionsLoaded value)? loaded,
    TResult? Function(_TransactionsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionsInitial value)? initial,
    TResult Function(_TransactionsLoading value)? loading,
    TResult Function(_TransactionsLoaded value)? loaded,
    TResult Function(_TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TransactionsFailure implements TransactionsState {
  const factory _TransactionsFailure(final String message) =
      _$TransactionsFailureImpl;

  String get message;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsFailureImplCopyWith<_$TransactionsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
