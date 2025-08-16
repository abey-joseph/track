// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsEventCopyWith<$Res> {
  factory $AccountsEventCopyWith(
          AccountsEvent value, $Res Function(AccountsEvent) then) =
      _$AccountsEventCopyWithImpl<$Res, AccountsEvent>;
}

/// @nodoc
class _$AccountsEventCopyWithImpl<$Res, $Val extends AccountsEvent>
    implements $AccountsEventCopyWith<$Res> {
  _$AccountsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountsLoadImplCopyWith<$Res> {
  factory _$$AccountsLoadImplCopyWith(
          _$AccountsLoadImpl value, $Res Function(_$AccountsLoadImpl) then) =
      __$$AccountsLoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$AccountsLoadImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsLoadImpl>
    implements _$$AccountsLoadImplCopyWith<$Res> {
  __$$AccountsLoadImplCopyWithImpl(
      _$AccountsLoadImpl _value, $Res Function(_$AccountsLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$AccountsLoadImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountsLoadImpl implements _AccountsLoad {
  const _$AccountsLoadImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'AccountsEvent.load(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsLoadImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsLoadImplCopyWith<_$AccountsLoadImpl> get copyWith =>
      __$$AccountsLoadImplCopyWithImpl<_$AccountsLoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return load(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return load?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _AccountsLoad implements AccountsEvent {
  const factory _AccountsLoad({required final String uid}) = _$AccountsLoadImpl;

  String get uid;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsLoadImplCopyWith<_$AccountsLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsAddImplCopyWith<$Res> {
  factory _$$AccountsAddImplCopyWith(
          _$AccountsAddImpl value, $Res Function(_$AccountsAddImpl) then) =
      __$$AccountsAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$AccountsAddImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsAddImpl>
    implements _$$AccountsAddImplCopyWith<$Res> {
  __$$AccountsAddImplCopyWithImpl(
      _$AccountsAddImpl _value, $Res Function(_$AccountsAddImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$AccountsAddImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$AccountsAddImpl implements _AccountsAdd {
  const _$AccountsAddImpl({required this.account});

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'AccountsEvent.add(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsAddImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsAddImplCopyWith<_$AccountsAddImpl> get copyWith =>
      __$$AccountsAddImplCopyWithImpl<_$AccountsAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return add(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return add?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _AccountsAdd implements AccountsEvent {
  const factory _AccountsAdd({required final AccountEntity account}) =
      _$AccountsAddImpl;

  AccountEntity get account;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsAddImplCopyWith<_$AccountsAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsUpdateImplCopyWith<$Res> {
  factory _$$AccountsUpdateImplCopyWith(_$AccountsUpdateImpl value,
          $Res Function(_$AccountsUpdateImpl) then) =
      __$$AccountsUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountEntity account});
}

/// @nodoc
class __$$AccountsUpdateImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsUpdateImpl>
    implements _$$AccountsUpdateImplCopyWith<$Res> {
  __$$AccountsUpdateImplCopyWithImpl(
      _$AccountsUpdateImpl _value, $Res Function(_$AccountsUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$AccountsUpdateImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }
}

/// @nodoc

class _$AccountsUpdateImpl implements _AccountsUpdate {
  const _$AccountsUpdateImpl({required this.account});

  @override
  final AccountEntity account;

  @override
  String toString() {
    return 'AccountsEvent.update(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsUpdateImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsUpdateImplCopyWith<_$AccountsUpdateImpl> get copyWith =>
      __$$AccountsUpdateImplCopyWithImpl<_$AccountsUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return update(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return update?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _AccountsUpdate implements AccountsEvent {
  const factory _AccountsUpdate({required final AccountEntity account}) =
      _$AccountsUpdateImpl;

  AccountEntity get account;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsUpdateImplCopyWith<_$AccountsUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsDeleteImplCopyWith<$Res> {
  factory _$$AccountsDeleteImplCopyWith(_$AccountsDeleteImpl value,
          $Res Function(_$AccountsDeleteImpl) then) =
      __$$AccountsDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountId, String uid});
}

/// @nodoc
class __$$AccountsDeleteImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsDeleteImpl>
    implements _$$AccountsDeleteImplCopyWith<$Res> {
  __$$AccountsDeleteImplCopyWithImpl(
      _$AccountsDeleteImpl _value, $Res Function(_$AccountsDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? uid = null,
  }) {
    return _then(_$AccountsDeleteImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountsDeleteImpl implements _AccountsDelete {
  const _$AccountsDeleteImpl({required this.accountId, required this.uid});

  @override
  final int accountId;
  @override
  final String uid;

  @override
  String toString() {
    return 'AccountsEvent.delete(accountId: $accountId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsDeleteImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, uid);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsDeleteImplCopyWith<_$AccountsDeleteImpl> get copyWith =>
      __$$AccountsDeleteImplCopyWithImpl<_$AccountsDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return delete(accountId, uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return delete?.call(accountId, uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(accountId, uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _AccountsDelete implements AccountsEvent {
  const factory _AccountsDelete(
      {required final int accountId,
      required final String uid}) = _$AccountsDeleteImpl;

  int get accountId;
  String get uid;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsDeleteImplCopyWith<_$AccountsDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsSetDefaultImplCopyWith<$Res> {
  factory _$$AccountsSetDefaultImplCopyWith(_$AccountsSetDefaultImpl value,
          $Res Function(_$AccountsSetDefaultImpl) then) =
      __$$AccountsSetDefaultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountId, String uid});
}

/// @nodoc
class __$$AccountsSetDefaultImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsSetDefaultImpl>
    implements _$$AccountsSetDefaultImplCopyWith<$Res> {
  __$$AccountsSetDefaultImplCopyWithImpl(_$AccountsSetDefaultImpl _value,
      $Res Function(_$AccountsSetDefaultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? uid = null,
  }) {
    return _then(_$AccountsSetDefaultImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountsSetDefaultImpl implements _AccountsSetDefault {
  const _$AccountsSetDefaultImpl({required this.accountId, required this.uid});

  @override
  final int accountId;
  @override
  final String uid;

  @override
  String toString() {
    return 'AccountsEvent.setDefault(accountId: $accountId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsSetDefaultImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, uid);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsSetDefaultImplCopyWith<_$AccountsSetDefaultImpl> get copyWith =>
      __$$AccountsSetDefaultImplCopyWithImpl<_$AccountsSetDefaultImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return setDefault(accountId, uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return setDefault?.call(accountId, uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(accountId, uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return setDefault(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return setDefault?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(this);
    }
    return orElse();
  }
}

abstract class _AccountsSetDefault implements AccountsEvent {
  const factory _AccountsSetDefault(
      {required final int accountId,
      required final String uid}) = _$AccountsSetDefaultImpl;

  int get accountId;
  String get uid;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsSetDefaultImplCopyWith<_$AccountsSetDefaultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsReloadImplCopyWith<$Res> {
  factory _$$AccountsReloadImplCopyWith(_$AccountsReloadImpl value,
          $Res Function(_$AccountsReloadImpl) then) =
      __$$AccountsReloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$AccountsReloadImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$AccountsReloadImpl>
    implements _$$AccountsReloadImplCopyWith<$Res> {
  __$$AccountsReloadImplCopyWithImpl(
      _$AccountsReloadImpl _value, $Res Function(_$AccountsReloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$AccountsReloadImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountsReloadImpl implements _AccountsReload {
  const _$AccountsReloadImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'AccountsEvent.reload(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReloadImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReloadImplCopyWith<_$AccountsReloadImpl> get copyWith =>
      __$$AccountsReloadImplCopyWithImpl<_$AccountsReloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(AccountEntity account) add,
    required TResult Function(AccountEntity account) update,
    required TResult Function(int accountId, String uid) delete,
    required TResult Function(int accountId, String uid) setDefault,
    required TResult Function(String uid) reload,
  }) {
    return reload(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(AccountEntity account)? add,
    TResult? Function(AccountEntity account)? update,
    TResult? Function(int accountId, String uid)? delete,
    TResult? Function(int accountId, String uid)? setDefault,
    TResult? Function(String uid)? reload,
  }) {
    return reload?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(AccountEntity account)? add,
    TResult Function(AccountEntity account)? update,
    TResult Function(int accountId, String uid)? delete,
    TResult Function(int accountId, String uid)? setDefault,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoad value) load,
    required TResult Function(_AccountsAdd value) add,
    required TResult Function(_AccountsUpdate value) update,
    required TResult Function(_AccountsDelete value) delete,
    required TResult Function(_AccountsSetDefault value) setDefault,
    required TResult Function(_AccountsReload value) reload,
  }) {
    return reload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoad value)? load,
    TResult? Function(_AccountsAdd value)? add,
    TResult? Function(_AccountsUpdate value)? update,
    TResult? Function(_AccountsDelete value)? delete,
    TResult? Function(_AccountsSetDefault value)? setDefault,
    TResult? Function(_AccountsReload value)? reload,
  }) {
    return reload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoad value)? load,
    TResult Function(_AccountsAdd value)? add,
    TResult Function(_AccountsUpdate value)? update,
    TResult Function(_AccountsDelete value)? delete,
    TResult Function(_AccountsSetDefault value)? setDefault,
    TResult Function(_AccountsReload value)? reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class _AccountsReload implements AccountsEvent {
  const factory _AccountsReload({required final String uid}) =
      _$AccountsReloadImpl;

  String get uid;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReloadImplCopyWith<_$AccountsReloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AccountEntity> accounts) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AccountEntity> accounts)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AccountEntity> accounts)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsInitial value) initial,
    required TResult Function(_AccountsLoading value) loading,
    required TResult Function(_AccountsLoaded value) loaded,
    required TResult Function(_AccountsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsInitial value)? initial,
    TResult? Function(_AccountsLoading value)? loading,
    TResult? Function(_AccountsLoaded value)? loaded,
    TResult? Function(_AccountsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsInitial value)? initial,
    TResult Function(_AccountsLoading value)? loading,
    TResult Function(_AccountsLoaded value)? loaded,
    TResult Function(_AccountsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(
          AccountsState value, $Res Function(AccountsState) then) =
      _$AccountsStateCopyWithImpl<$Res, AccountsState>;
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res, $Val extends AccountsState>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountsInitialImplCopyWith<$Res> {
  factory _$$AccountsInitialImplCopyWith(_$AccountsInitialImpl value,
          $Res Function(_$AccountsInitialImpl) then) =
      __$$AccountsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountsInitialImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$AccountsInitialImpl>
    implements _$$AccountsInitialImplCopyWith<$Res> {
  __$$AccountsInitialImplCopyWithImpl(
      _$AccountsInitialImpl _value, $Res Function(_$AccountsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountsInitialImpl implements _AccountsInitial {
  const _$AccountsInitialImpl();

  @override
  String toString() {
    return 'AccountsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AccountEntity> accounts) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AccountEntity> accounts)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AccountEntity> accounts)? loaded,
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
    required TResult Function(_AccountsInitial value) initial,
    required TResult Function(_AccountsLoading value) loading,
    required TResult Function(_AccountsLoaded value) loaded,
    required TResult Function(_AccountsFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsInitial value)? initial,
    TResult? Function(_AccountsLoading value)? loading,
    TResult? Function(_AccountsLoaded value)? loaded,
    TResult? Function(_AccountsFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsInitial value)? initial,
    TResult Function(_AccountsLoading value)? loading,
    TResult Function(_AccountsLoaded value)? loaded,
    TResult Function(_AccountsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AccountsInitial implements AccountsState {
  const factory _AccountsInitial() = _$AccountsInitialImpl;
}

/// @nodoc
abstract class _$$AccountsLoadingImplCopyWith<$Res> {
  factory _$$AccountsLoadingImplCopyWith(_$AccountsLoadingImpl value,
          $Res Function(_$AccountsLoadingImpl) then) =
      __$$AccountsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountsLoadingImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$AccountsLoadingImpl>
    implements _$$AccountsLoadingImplCopyWith<$Res> {
  __$$AccountsLoadingImplCopyWithImpl(
      _$AccountsLoadingImpl _value, $Res Function(_$AccountsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountsLoadingImpl implements _AccountsLoading {
  const _$AccountsLoadingImpl();

  @override
  String toString() {
    return 'AccountsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AccountEntity> accounts) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AccountEntity> accounts)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AccountEntity> accounts)? loaded,
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
    required TResult Function(_AccountsInitial value) initial,
    required TResult Function(_AccountsLoading value) loading,
    required TResult Function(_AccountsLoaded value) loaded,
    required TResult Function(_AccountsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsInitial value)? initial,
    TResult? Function(_AccountsLoading value)? loading,
    TResult? Function(_AccountsLoaded value)? loaded,
    TResult? Function(_AccountsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsInitial value)? initial,
    TResult Function(_AccountsLoading value)? loading,
    TResult Function(_AccountsLoaded value)? loaded,
    TResult Function(_AccountsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AccountsLoading implements AccountsState {
  const factory _AccountsLoading() = _$AccountsLoadingImpl;
}

/// @nodoc
abstract class _$$AccountsLoadedImplCopyWith<$Res> {
  factory _$$AccountsLoadedImplCopyWith(_$AccountsLoadedImpl value,
          $Res Function(_$AccountsLoadedImpl) then) =
      __$$AccountsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AccountEntity> accounts});
}

/// @nodoc
class __$$AccountsLoadedImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$AccountsLoadedImpl>
    implements _$$AccountsLoadedImplCopyWith<$Res> {
  __$$AccountsLoadedImplCopyWithImpl(
      _$AccountsLoadedImpl _value, $Res Function(_$AccountsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$AccountsLoadedImpl(
      null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountEntity>,
    ));
  }
}

/// @nodoc

class _$AccountsLoadedImpl implements _AccountsLoaded {
  const _$AccountsLoadedImpl(final List<AccountEntity> accounts)
      : _accounts = accounts;

  final List<AccountEntity> _accounts;
  @override
  List<AccountEntity> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'AccountsState.loaded(accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsLoadedImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsLoadedImplCopyWith<_$AccountsLoadedImpl> get copyWith =>
      __$$AccountsLoadedImplCopyWithImpl<_$AccountsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AccountEntity> accounts) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AccountEntity> accounts)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AccountEntity> accounts)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(accounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsInitial value) initial,
    required TResult Function(_AccountsLoading value) loading,
    required TResult Function(_AccountsLoaded value) loaded,
    required TResult Function(_AccountsFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsInitial value)? initial,
    TResult? Function(_AccountsLoading value)? loading,
    TResult? Function(_AccountsLoaded value)? loaded,
    TResult? Function(_AccountsFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsInitial value)? initial,
    TResult Function(_AccountsLoading value)? loading,
    TResult Function(_AccountsLoaded value)? loaded,
    TResult Function(_AccountsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AccountsLoaded implements AccountsState {
  const factory _AccountsLoaded(final List<AccountEntity> accounts) =
      _$AccountsLoadedImpl;

  List<AccountEntity> get accounts;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsLoadedImplCopyWith<_$AccountsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsFailureImplCopyWith<$Res> {
  factory _$$AccountsFailureImplCopyWith(_$AccountsFailureImpl value,
          $Res Function(_$AccountsFailureImpl) then) =
      __$$AccountsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountsFailureImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$AccountsFailureImpl>
    implements _$$AccountsFailureImplCopyWith<$Res> {
  __$$AccountsFailureImplCopyWithImpl(
      _$AccountsFailureImpl _value, $Res Function(_$AccountsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccountsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountsFailureImpl implements _AccountsFailure {
  const _$AccountsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsFailureImplCopyWith<_$AccountsFailureImpl> get copyWith =>
      __$$AccountsFailureImplCopyWithImpl<_$AccountsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<AccountEntity> accounts) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<AccountEntity> accounts)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<AccountEntity> accounts)? loaded,
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
    required TResult Function(_AccountsInitial value) initial,
    required TResult Function(_AccountsLoading value) loading,
    required TResult Function(_AccountsLoaded value) loaded,
    required TResult Function(_AccountsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsInitial value)? initial,
    TResult? Function(_AccountsLoading value)? loading,
    TResult? Function(_AccountsLoaded value)? loaded,
    TResult? Function(_AccountsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsInitial value)? initial,
    TResult Function(_AccountsLoading value)? loading,
    TResult Function(_AccountsLoaded value)? loaded,
    TResult Function(_AccountsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AccountsFailure implements AccountsState {
  const factory _AccountsFailure(final String message) = _$AccountsFailureImpl;

  String get message;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsFailureImplCopyWith<_$AccountsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
