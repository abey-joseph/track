// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesEventCopyWith<$Res> {
  factory $CategoriesEventCopyWith(
          CategoriesEvent value, $Res Function(CategoriesEvent) then) =
      _$CategoriesEventCopyWithImpl<$Res, CategoriesEvent>;
}

/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res, $Val extends CategoriesEvent>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CategoriesLoadImplCopyWith<$Res> {
  factory _$$CategoriesLoadImplCopyWith(_$CategoriesLoadImpl value,
          $Res Function(_$CategoriesLoadImpl) then) =
      __$$CategoriesLoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$CategoriesLoadImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesLoadImpl>
    implements _$$CategoriesLoadImplCopyWith<$Res> {
  __$$CategoriesLoadImplCopyWithImpl(
      _$CategoriesLoadImpl _value, $Res Function(_$CategoriesLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$CategoriesLoadImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesLoadImpl implements _CategoriesLoad {
  const _$CategoriesLoadImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'CategoriesEvent.load(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesLoadImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesLoadImplCopyWith<_$CategoriesLoadImpl> get copyWith =>
      __$$CategoriesLoadImplCopyWithImpl<_$CategoriesLoadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) {
    return load(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) {
    return load?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
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
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _CategoriesLoad implements CategoriesEvent {
  const factory _CategoriesLoad({required final String uid}) =
      _$CategoriesLoadImpl;

  String get uid;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesLoadImplCopyWith<_$CategoriesLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesAddImplCopyWith<$Res> {
  factory _$$CategoriesAddImplCopyWith(
          _$CategoriesAddImpl value, $Res Function(_$CategoriesAddImpl) then) =
      __$$CategoriesAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEntity category});
}

/// @nodoc
class __$$CategoriesAddImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesAddImpl>
    implements _$$CategoriesAddImplCopyWith<$Res> {
  __$$CategoriesAddImplCopyWithImpl(
      _$CategoriesAddImpl _value, $Res Function(_$CategoriesAddImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoriesAddImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc

class _$CategoriesAddImpl implements _CategoriesAdd {
  const _$CategoriesAddImpl({required this.category});

  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'CategoriesEvent.add(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesAddImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesAddImplCopyWith<_$CategoriesAddImpl> get copyWith =>
      __$$CategoriesAddImplCopyWithImpl<_$CategoriesAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) {
    return add(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) {
    return add?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _CategoriesAdd implements CategoriesEvent {
  const factory _CategoriesAdd({required final CategoryEntity category}) =
      _$CategoriesAddImpl;

  CategoryEntity get category;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesAddImplCopyWith<_$CategoriesAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesUpdateImplCopyWith<$Res> {
  factory _$$CategoriesUpdateImplCopyWith(_$CategoriesUpdateImpl value,
          $Res Function(_$CategoriesUpdateImpl) then) =
      __$$CategoriesUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEntity category});
}

/// @nodoc
class __$$CategoriesUpdateImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesUpdateImpl>
    implements _$$CategoriesUpdateImplCopyWith<$Res> {
  __$$CategoriesUpdateImplCopyWithImpl(_$CategoriesUpdateImpl _value,
      $Res Function(_$CategoriesUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoriesUpdateImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEntity,
    ));
  }
}

/// @nodoc

class _$CategoriesUpdateImpl implements _CategoriesUpdate {
  const _$CategoriesUpdateImpl({required this.category});

  @override
  final CategoryEntity category;

  @override
  String toString() {
    return 'CategoriesEvent.update(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesUpdateImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesUpdateImplCopyWith<_$CategoriesUpdateImpl> get copyWith =>
      __$$CategoriesUpdateImplCopyWithImpl<_$CategoriesUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) {
    return update(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) {
    return update?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _CategoriesUpdate implements CategoriesEvent {
  const factory _CategoriesUpdate({required final CategoryEntity category}) =
      _$CategoriesUpdateImpl;

  CategoryEntity get category;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesUpdateImplCopyWith<_$CategoriesUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesDeleteImplCopyWith<$Res> {
  factory _$$CategoriesDeleteImplCopyWith(_$CategoriesDeleteImpl value,
          $Res Function(_$CategoriesDeleteImpl) then) =
      __$$CategoriesDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId, String uid});
}

/// @nodoc
class __$$CategoriesDeleteImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesDeleteImpl>
    implements _$$CategoriesDeleteImplCopyWith<$Res> {
  __$$CategoriesDeleteImplCopyWithImpl(_$CategoriesDeleteImpl _value,
      $Res Function(_$CategoriesDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? uid = null,
  }) {
    return _then(_$CategoriesDeleteImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesDeleteImpl implements _CategoriesDelete {
  const _$CategoriesDeleteImpl({required this.categoryId, required this.uid});

  @override
  final int categoryId;
  @override
  final String uid;

  @override
  String toString() {
    return 'CategoriesEvent.delete(categoryId: $categoryId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesDeleteImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, uid);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesDeleteImplCopyWith<_$CategoriesDeleteImpl> get copyWith =>
      __$$CategoriesDeleteImplCopyWithImpl<_$CategoriesDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) {
    return delete(categoryId, uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) {
    return delete?.call(categoryId, uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
    TResult Function(String uid)? reload,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(categoryId, uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _CategoriesDelete implements CategoriesEvent {
  const factory _CategoriesDelete(
      {required final int categoryId,
      required final String uid}) = _$CategoriesDeleteImpl;

  int get categoryId;
  String get uid;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesDeleteImplCopyWith<_$CategoriesDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesReloadImplCopyWith<$Res> {
  factory _$$CategoriesReloadImplCopyWith(_$CategoriesReloadImpl value,
          $Res Function(_$CategoriesReloadImpl) then) =
      __$$CategoriesReloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$CategoriesReloadImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesReloadImpl>
    implements _$$CategoriesReloadImplCopyWith<$Res> {
  __$$CategoriesReloadImplCopyWithImpl(_$CategoriesReloadImpl _value,
      $Res Function(_$CategoriesReloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$CategoriesReloadImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesReloadImpl implements _CategoriesReload {
  const _$CategoriesReloadImpl({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'CategoriesEvent.reload(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesReloadImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesReloadImplCopyWith<_$CategoriesReloadImpl> get copyWith =>
      __$$CategoriesReloadImplCopyWithImpl<_$CategoriesReloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) load,
    required TResult Function(CategoryEntity category) add,
    required TResult Function(CategoryEntity category) update,
    required TResult Function(int categoryId, String uid) delete,
    required TResult Function(String uid) reload,
  }) {
    return reload(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? load,
    TResult? Function(CategoryEntity category)? add,
    TResult? Function(CategoryEntity category)? update,
    TResult? Function(int categoryId, String uid)? delete,
    TResult? Function(String uid)? reload,
  }) {
    return reload?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? load,
    TResult Function(CategoryEntity category)? add,
    TResult Function(CategoryEntity category)? update,
    TResult Function(int categoryId, String uid)? delete,
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
    required TResult Function(_CategoriesLoad value) load,
    required TResult Function(_CategoriesAdd value) add,
    required TResult Function(_CategoriesUpdate value) update,
    required TResult Function(_CategoriesDelete value) delete,
    required TResult Function(_CategoriesReload value) reload,
  }) {
    return reload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesLoad value)? load,
    TResult? Function(_CategoriesAdd value)? add,
    TResult? Function(_CategoriesUpdate value)? update,
    TResult? Function(_CategoriesDelete value)? delete,
    TResult? Function(_CategoriesReload value)? reload,
  }) {
    return reload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesLoad value)? load,
    TResult Function(_CategoriesAdd value)? add,
    TResult Function(_CategoriesUpdate value)? update,
    TResult Function(_CategoriesDelete value)? delete,
    TResult Function(_CategoriesReload value)? reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class _CategoriesReload implements CategoriesEvent {
  const factory _CategoriesReload({required final String uid}) =
      _$CategoriesReloadImpl;

  String get uid;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesReloadImplCopyWith<_$CategoriesReloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryEntity> categories) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntity> categories)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryEntity> categories)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesInitial value) initial,
    required TResult Function(_CategoriesLoading value) loading,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesInitial value)? initial,
    TResult? Function(_CategoriesLoading value)? loading,
    TResult? Function(_CategoriesLoaded value)? loaded,
    TResult? Function(_CategoriesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesInitial value)? initial,
    TResult Function(_CategoriesLoading value)? loading,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CategoriesInitialImplCopyWith<$Res> {
  factory _$$CategoriesInitialImplCopyWith(_$CategoriesInitialImpl value,
          $Res Function(_$CategoriesInitialImpl) then) =
      __$$CategoriesInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesInitialImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesInitialImpl>
    implements _$$CategoriesInitialImplCopyWith<$Res> {
  __$$CategoriesInitialImplCopyWithImpl(_$CategoriesInitialImpl _value,
      $Res Function(_$CategoriesInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoriesInitialImpl implements _CategoriesInitial {
  const _$CategoriesInitialImpl();

  @override
  String toString() {
    return 'CategoriesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryEntity> categories) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntity> categories)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryEntity> categories)? loaded,
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
    required TResult Function(_CategoriesInitial value) initial,
    required TResult Function(_CategoriesLoading value) loading,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesInitial value)? initial,
    TResult? Function(_CategoriesLoading value)? loading,
    TResult? Function(_CategoriesLoaded value)? loaded,
    TResult? Function(_CategoriesFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesInitial value)? initial,
    TResult Function(_CategoriesLoading value)? loading,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CategoriesInitial implements CategoriesState {
  const factory _CategoriesInitial() = _$CategoriesInitialImpl;
}

/// @nodoc
abstract class _$$CategoriesLoadingImplCopyWith<$Res> {
  factory _$$CategoriesLoadingImplCopyWith(_$CategoriesLoadingImpl value,
          $Res Function(_$CategoriesLoadingImpl) then) =
      __$$CategoriesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesLoadingImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesLoadingImpl>
    implements _$$CategoriesLoadingImplCopyWith<$Res> {
  __$$CategoriesLoadingImplCopyWithImpl(_$CategoriesLoadingImpl _value,
      $Res Function(_$CategoriesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoriesLoadingImpl implements _CategoriesLoading {
  const _$CategoriesLoadingImpl();

  @override
  String toString() {
    return 'CategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryEntity> categories) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntity> categories)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryEntity> categories)? loaded,
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
    required TResult Function(_CategoriesInitial value) initial,
    required TResult Function(_CategoriesLoading value) loading,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesInitial value)? initial,
    TResult? Function(_CategoriesLoading value)? loading,
    TResult? Function(_CategoriesLoaded value)? loaded,
    TResult? Function(_CategoriesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesInitial value)? initial,
    TResult Function(_CategoriesLoading value)? loading,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CategoriesLoading implements CategoriesState {
  const factory _CategoriesLoading() = _$CategoriesLoadingImpl;
}

/// @nodoc
abstract class _$$CategoriesLoadedImplCopyWith<$Res> {
  factory _$$CategoriesLoadedImplCopyWith(_$CategoriesLoadedImpl value,
          $Res Function(_$CategoriesLoadedImpl) then) =
      __$$CategoriesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryEntity> categories});
}

/// @nodoc
class __$$CategoriesLoadedImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesLoadedImpl>
    implements _$$CategoriesLoadedImplCopyWith<$Res> {
  __$$CategoriesLoadedImplCopyWithImpl(_$CategoriesLoadedImpl _value,
      $Res Function(_$CategoriesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoriesLoadedImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ));
  }
}

/// @nodoc

class _$CategoriesLoadedImpl implements _CategoriesLoaded {
  const _$CategoriesLoadedImpl(final List<CategoryEntity> categories)
      : _categories = categories;

  final List<CategoryEntity> _categories;
  @override
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoriesState.loaded(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesLoadedImplCopyWith<_$CategoriesLoadedImpl> get copyWith =>
      __$$CategoriesLoadedImplCopyWithImpl<_$CategoriesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryEntity> categories) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntity> categories)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryEntity> categories)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoriesInitial value) initial,
    required TResult Function(_CategoriesLoading value) loading,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesInitial value)? initial,
    TResult? Function(_CategoriesLoading value)? loading,
    TResult? Function(_CategoriesLoaded value)? loaded,
    TResult? Function(_CategoriesFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesInitial value)? initial,
    TResult Function(_CategoriesLoading value)? loading,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _CategoriesLoaded implements CategoriesState {
  const factory _CategoriesLoaded(final List<CategoryEntity> categories) =
      _$CategoriesLoadedImpl;

  List<CategoryEntity> get categories;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesLoadedImplCopyWith<_$CategoriesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesFailureImplCopyWith<$Res> {
  factory _$$CategoriesFailureImplCopyWith(_$CategoriesFailureImpl value,
          $Res Function(_$CategoriesFailureImpl) then) =
      __$$CategoriesFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CategoriesFailureImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesFailureImpl>
    implements _$$CategoriesFailureImplCopyWith<$Res> {
  __$$CategoriesFailureImplCopyWithImpl(_$CategoriesFailureImpl _value,
      $Res Function(_$CategoriesFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CategoriesFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoriesFailureImpl implements _CategoriesFailure {
  const _$CategoriesFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CategoriesState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesFailureImplCopyWith<_$CategoriesFailureImpl> get copyWith =>
      __$$CategoriesFailureImplCopyWithImpl<_$CategoriesFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryEntity> categories) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntity> categories)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryEntity> categories)? loaded,
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
    required TResult Function(_CategoriesInitial value) initial,
    required TResult Function(_CategoriesLoading value) loading,
    required TResult Function(_CategoriesLoaded value) loaded,
    required TResult Function(_CategoriesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoriesInitial value)? initial,
    TResult? Function(_CategoriesLoading value)? loading,
    TResult? Function(_CategoriesLoaded value)? loaded,
    TResult? Function(_CategoriesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoriesInitial value)? initial,
    TResult Function(_CategoriesLoading value)? loading,
    TResult Function(_CategoriesLoaded value)? loaded,
    TResult Function(_CategoriesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _CategoriesFailure implements CategoriesState {
  const factory _CategoriesFailure(final String message) =
      _$CategoriesFailureImpl;

  String get message;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesFailureImplCopyWith<_$CategoriesFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
