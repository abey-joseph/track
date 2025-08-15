// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeRateModel _$ExchangeRateModelFromJson(Map<String, dynamic> json) {
  return _ExchangeRateModel.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRateModel {
  @JsonKey(name: 'rate_date')
  DateTime get rateDate => throw _privateConstructorUsedError;
  String get base => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  /// Serializes this ExchangeRateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeRateModelCopyWith<ExchangeRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateModelCopyWith<$Res> {
  factory $ExchangeRateModelCopyWith(
          ExchangeRateModel value, $Res Function(ExchangeRateModel) then) =
      _$ExchangeRateModelCopyWithImpl<$Res, ExchangeRateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rate_date') DateTime rateDate,
      String base,
      String quote,
      double rate});
}

/// @nodoc
class _$ExchangeRateModelCopyWithImpl<$Res, $Val extends ExchangeRateModel>
    implements $ExchangeRateModelCopyWith<$Res> {
  _$ExchangeRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateDate = null,
    Object? base = null,
    Object? quote = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      rateDate: null == rateDate
          ? _value.rateDate
          : rateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeRateModelImplCopyWith<$Res>
    implements $ExchangeRateModelCopyWith<$Res> {
  factory _$$ExchangeRateModelImplCopyWith(_$ExchangeRateModelImpl value,
          $Res Function(_$ExchangeRateModelImpl) then) =
      __$$ExchangeRateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rate_date') DateTime rateDate,
      String base,
      String quote,
      double rate});
}

/// @nodoc
class __$$ExchangeRateModelImplCopyWithImpl<$Res>
    extends _$ExchangeRateModelCopyWithImpl<$Res, _$ExchangeRateModelImpl>
    implements _$$ExchangeRateModelImplCopyWith<$Res> {
  __$$ExchangeRateModelImplCopyWithImpl(_$ExchangeRateModelImpl _value,
      $Res Function(_$ExchangeRateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateDate = null,
    Object? base = null,
    Object? quote = null,
    Object? rate = null,
  }) {
    return _then(_$ExchangeRateModelImpl(
      rateDate: null == rateDate
          ? _value.rateDate
          : rateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeRateModelImpl implements _ExchangeRateModel {
  const _$ExchangeRateModelImpl(
      {@JsonKey(name: 'rate_date') required this.rateDate,
      required this.base,
      required this.quote,
      required this.rate});

  factory _$ExchangeRateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeRateModelImplFromJson(json);

  @override
  @JsonKey(name: 'rate_date')
  final DateTime rateDate;
  @override
  final String base;
  @override
  final String quote;
  @override
  final double rate;

  @override
  String toString() {
    return 'ExchangeRateModel(rateDate: $rateDate, base: $base, quote: $quote, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeRateModelImpl &&
            (identical(other.rateDate, rateDate) ||
                other.rateDate == rateDate) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rateDate, base, quote, rate);

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeRateModelImplCopyWith<_$ExchangeRateModelImpl> get copyWith =>
      __$$ExchangeRateModelImplCopyWithImpl<_$ExchangeRateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeRateModelImplToJson(
      this,
    );
  }
}

abstract class _ExchangeRateModel implements ExchangeRateModel {
  const factory _ExchangeRateModel(
      {@JsonKey(name: 'rate_date') required final DateTime rateDate,
      required final String base,
      required final String quote,
      required final double rate}) = _$ExchangeRateModelImpl;

  factory _ExchangeRateModel.fromJson(Map<String, dynamic> json) =
      _$ExchangeRateModelImpl.fromJson;

  @override
  @JsonKey(name: 'rate_date')
  DateTime get rateDate;
  @override
  String get base;
  @override
  String get quote;
  @override
  double get rate;

  /// Create a copy of ExchangeRateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeRateModelImplCopyWith<_$ExchangeRateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
