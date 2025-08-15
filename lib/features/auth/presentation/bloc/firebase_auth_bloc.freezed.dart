// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseAuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthEventCopyWith<$Res> {
  factory $FirebaseAuthEventCopyWith(
          FirebaseAuthEvent value, $Res Function(FirebaseAuthEvent) then) =
      _$FirebaseAuthEventCopyWithImpl<$Res, FirebaseAuthEvent>;
}

/// @nodoc
class _$FirebaseAuthEventCopyWithImpl<$Res, $Val extends FirebaseAuthEvent>
    implements $FirebaseAuthEventCopyWith<$Res> {
  _$FirebaseAuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckRequestedImplCopyWith<$Res> {
  factory _$$CheckRequestedImplCopyWith(_$CheckRequestedImpl value,
          $Res Function(_$CheckRequestedImpl) then) =
      __$$CheckRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckRequestedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthEventCopyWithImpl<$Res, _$CheckRequestedImpl>
    implements _$$CheckRequestedImplCopyWith<$Res> {
  __$$CheckRequestedImplCopyWithImpl(
      _$CheckRequestedImpl _value, $Res Function(_$CheckRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckRequestedImpl implements _CheckRequested {
  const _$CheckRequestedImpl();

  @override
  String toString() {
    return 'FirebaseAuthEvent.checkRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) {
    return checkRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) {
    return checkRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (checkRequested != null) {
      return checkRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) {
    return checkRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) {
    return checkRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (checkRequested != null) {
      return checkRequested(this);
    }
    return orElse();
  }
}

abstract class _CheckRequested implements FirebaseAuthEvent {
  const factory _CheckRequested() = _$CheckRequestedImpl;
}

/// @nodoc
abstract class _$$SignInRequestedImplCopyWith<$Res> {
  factory _$$SignInRequestedImplCopyWith(_$SignInRequestedImpl value,
          $Res Function(_$SignInRequestedImpl) then) =
      __$$SignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthEventCopyWithImpl<$Res, _$SignInRequestedImpl>
    implements _$$SignInRequestedImplCopyWith<$Res> {
  __$$SignInRequestedImplCopyWithImpl(
      _$SignInRequestedImpl _value, $Res Function(_$SignInRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInRequestedImpl implements _SignInRequested {
  const _$SignInRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'FirebaseAuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      __$$SignInRequestedImplCopyWithImpl<_$SignInRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class _SignInRequested implements FirebaseAuthEvent {
  const factory _SignInRequested(
      {required final String email,
      required final String password}) = _$SignInRequestedImpl;

  String get email;
  String get password;

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpRequestedImplCopyWith<$Res> {
  factory _$$SignUpRequestedImplCopyWith(_$SignUpRequestedImpl value,
          $Res Function(_$SignUpRequestedImpl) then) =
      __$$SignUpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpRequestedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthEventCopyWithImpl<$Res, _$SignUpRequestedImpl>
    implements _$$SignUpRequestedImplCopyWith<$Res> {
  __$$SignUpRequestedImplCopyWithImpl(
      _$SignUpRequestedImpl _value, $Res Function(_$SignUpRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpRequestedImpl implements _SignUpRequested {
  const _$SignUpRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'FirebaseAuthEvent.signUpRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      __$$SignUpRequestedImplCopyWithImpl<_$SignUpRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) {
    return signUpRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) {
    return signUpRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) {
    return signUpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) {
    return signUpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(this);
    }
    return orElse();
  }
}

abstract class _SignUpRequested implements FirebaseAuthEvent {
  const factory _SignUpRequested(
      {required final String email,
      required final String password}) = _$SignUpRequestedImpl;

  String get email;
  String get password;

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutRequestedImplCopyWith<$Res> {
  factory _$$SignOutRequestedImplCopyWith(_$SignOutRequestedImpl value,
          $Res Function(_$SignOutRequestedImpl) then) =
      __$$SignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutRequestedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthEventCopyWithImpl<$Res, _$SignOutRequestedImpl>
    implements _$$SignOutRequestedImplCopyWith<$Res> {
  __$$SignOutRequestedImplCopyWithImpl(_$SignOutRequestedImpl _value,
      $Res Function(_$SignOutRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutRequestedImpl implements _SignOutRequested {
  const _$SignOutRequestedImpl();

  @override
  String toString() {
    return 'FirebaseAuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class _SignOutRequested implements FirebaseAuthEvent {
  const factory _SignOutRequested() = _$SignOutRequestedImpl;
}

/// @nodoc
abstract class _$$SaveDisplayNameImplCopyWith<$Res> {
  factory _$$SaveDisplayNameImplCopyWith(_$SaveDisplayNameImpl value,
          $Res Function(_$SaveDisplayNameImpl) then) =
      __$$SaveDisplayNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SaveDisplayNameImplCopyWithImpl<$Res>
    extends _$FirebaseAuthEventCopyWithImpl<$Res, _$SaveDisplayNameImpl>
    implements _$$SaveDisplayNameImplCopyWith<$Res> {
  __$$SaveDisplayNameImplCopyWithImpl(
      _$SaveDisplayNameImpl _value, $Res Function(_$SaveDisplayNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SaveDisplayNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveDisplayNameImpl implements _SaveDisplayName {
  const _$SaveDisplayNameImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'FirebaseAuthEvent.saveDisplayName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveDisplayNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveDisplayNameImplCopyWith<_$SaveDisplayNameImpl> get copyWith =>
      __$$SaveDisplayNameImplCopyWithImpl<_$SaveDisplayNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String name) saveDisplayName,
  }) {
    return saveDisplayName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String name)? saveDisplayName,
  }) {
    return saveDisplayName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function(String name)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (saveDisplayName != null) {
      return saveDisplayName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckRequested value) checkRequested,
    required TResult Function(_SignInRequested value) signInRequested,
    required TResult Function(_SignUpRequested value) signUpRequested,
    required TResult Function(_SignOutRequested value) signOutRequested,
    required TResult Function(_SaveDisplayName value) saveDisplayName,
  }) {
    return saveDisplayName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckRequested value)? checkRequested,
    TResult? Function(_SignInRequested value)? signInRequested,
    TResult? Function(_SignUpRequested value)? signUpRequested,
    TResult? Function(_SignOutRequested value)? signOutRequested,
    TResult? Function(_SaveDisplayName value)? saveDisplayName,
  }) {
    return saveDisplayName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckRequested value)? checkRequested,
    TResult Function(_SignInRequested value)? signInRequested,
    TResult Function(_SignUpRequested value)? signUpRequested,
    TResult Function(_SignOutRequested value)? signOutRequested,
    TResult Function(_SaveDisplayName value)? saveDisplayName,
    required TResult orElse(),
  }) {
    if (saveDisplayName != null) {
      return saveDisplayName(this);
    }
    return orElse();
  }
}

abstract class _SaveDisplayName implements FirebaseAuthEvent {
  const factory _SaveDisplayName({required final String name}) =
      _$SaveDisplayNameImpl;

  String get name;

  /// Create a copy of FirebaseAuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveDisplayNameImplCopyWith<_$SaveDisplayNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FirebaseAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthStateCopyWith<$Res> {
  factory $FirebaseAuthStateCopyWith(
          FirebaseAuthState value, $Res Function(FirebaseAuthState) then) =
      _$FirebaseAuthStateCopyWithImpl<$Res, FirebaseAuthState>;
}

/// @nodoc
class _$FirebaseAuthStateCopyWithImpl<$Res, $Val extends FirebaseAuthState>
    implements $FirebaseAuthStateCopyWith<$Res> {
  _$FirebaseAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$authInitialImplCopyWith<$Res> {
  factory _$$authInitialImplCopyWith(
          _$authInitialImpl value, $Res Function(_$authInitialImpl) then) =
      __$$authInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$authInitialImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authInitialImpl>
    implements _$$authInitialImplCopyWith<$Res> {
  __$$authInitialImplCopyWithImpl(
      _$authInitialImpl _value, $Res Function(_$authInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$authInitialImpl implements authInitial {
  const _$authInitialImpl();

  @override
  String toString() {
    return 'FirebaseAuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$authInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
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
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class authInitial implements FirebaseAuthState {
  const factory authInitial() = _$authInitialImpl;
}

/// @nodoc
abstract class _$$authLoadingImplCopyWith<$Res> {
  factory _$$authLoadingImplCopyWith(
          _$authLoadingImpl value, $Res Function(_$authLoadingImpl) then) =
      __$$authLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$authLoadingImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authLoadingImpl>
    implements _$$authLoadingImplCopyWith<$Res> {
  __$$authLoadingImplCopyWithImpl(
      _$authLoadingImpl _value, $Res Function(_$authLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$authLoadingImpl implements authLoading {
  const _$authLoadingImpl();

  @override
  String toString() {
    return 'FirebaseAuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$authLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
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
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class authLoading implements FirebaseAuthState {
  const factory authLoading() = _$authLoadingImpl;
}

/// @nodoc
abstract class _$$authAuthenticatedImplCopyWith<$Res> {
  factory _$$authAuthenticatedImplCopyWith(_$authAuthenticatedImpl value,
          $Res Function(_$authAuthenticatedImpl) then) =
      __$$authAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid, String email, String? displayName});
}

/// @nodoc
class __$$authAuthenticatedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authAuthenticatedImpl>
    implements _$$authAuthenticatedImplCopyWith<$Res> {
  __$$authAuthenticatedImplCopyWithImpl(_$authAuthenticatedImpl _value,
      $Res Function(_$authAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
  }) {
    return _then(_$authAuthenticatedImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$authAuthenticatedImpl implements authAuthenticated {
  const _$authAuthenticatedImpl(
      {required this.uid, required this.email, this.displayName});

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'FirebaseAuthState.authenticated(uid: $uid, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authAuthenticatedImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, email, displayName);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$authAuthenticatedImplCopyWith<_$authAuthenticatedImpl> get copyWith =>
      __$$authAuthenticatedImplCopyWithImpl<_$authAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) {
    return authenticated(uid, email, displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) {
    return authenticated?.call(uid, email, displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(uid, email, displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class authAuthenticated implements FirebaseAuthState {
  const factory authAuthenticated(
      {required final String uid,
      required final String email,
      final String? displayName}) = _$authAuthenticatedImpl;

  String get uid;
  String get email;
  String? get displayName;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$authAuthenticatedImplCopyWith<_$authAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$authUnauthenticatedImplCopyWith<$Res> {
  factory _$$authUnauthenticatedImplCopyWith(_$authUnauthenticatedImpl value,
          $Res Function(_$authUnauthenticatedImpl) then) =
      __$$authUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$authUnauthenticatedImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authUnauthenticatedImpl>
    implements _$$authUnauthenticatedImplCopyWith<$Res> {
  __$$authUnauthenticatedImplCopyWithImpl(_$authUnauthenticatedImpl _value,
      $Res Function(_$authUnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$authUnauthenticatedImpl implements authUnauthenticated {
  const _$authUnauthenticatedImpl();

  @override
  String toString() {
    return 'FirebaseAuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class authUnauthenticated implements FirebaseAuthState {
  const factory authUnauthenticated() = _$authUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$authFailureImplCopyWith<$Res> {
  factory _$$authFailureImplCopyWith(
          _$authFailureImpl value, $Res Function(_$authFailureImpl) then) =
      __$$authFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$authFailureImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$authFailureImpl>
    implements _$$authFailureImplCopyWith<$Res> {
  __$$authFailureImplCopyWithImpl(
      _$authFailureImpl _value, $Res Function(_$authFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$authFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$authFailureImpl implements authFailure {
  const _$authFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseAuthState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$authFailureImplCopyWith<_$authFailureImpl> get copyWith =>
      __$$authFailureImplCopyWithImpl<_$authFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid, String email, String? displayName)
        authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid, String email, String? displayName)?
        authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid, String email, String? displayName)?
        authenticated,
    TResult Function()? unauthenticated,
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
    required TResult Function(authInitial value) initial,
    required TResult Function(authLoading value) loading,
    required TResult Function(authAuthenticated value) authenticated,
    required TResult Function(authUnauthenticated value) unauthenticated,
    required TResult Function(authFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(authInitial value)? initial,
    TResult? Function(authLoading value)? loading,
    TResult? Function(authAuthenticated value)? authenticated,
    TResult? Function(authUnauthenticated value)? unauthenticated,
    TResult? Function(authFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(authInitial value)? initial,
    TResult Function(authLoading value)? loading,
    TResult Function(authAuthenticated value)? authenticated,
    TResult Function(authUnauthenticated value)? unauthenticated,
    TResult Function(authFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class authFailure implements FirebaseAuthState {
  const factory authFailure(final String message) = _$authFailureImpl;

  String get message;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$authFailureImplCopyWith<_$authFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
