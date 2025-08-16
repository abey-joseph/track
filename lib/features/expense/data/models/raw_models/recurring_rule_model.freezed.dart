// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurringRuleModel _$RecurringRuleModelFromJson(Map<String, dynamic> json) {
  return _RecurringRuleModel.fromJson(json);
}

/// @nodoc
mixin _$RecurringRuleModel {
  @JsonKey(name: 'rule_id')
  int? get ruleId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'template_json')
  String get templateJson => throw _privateConstructorUsedError;
  RecurringFrequencyModel get freq => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  String? get byweekday => throw _privateConstructorUsedError;
  String? get bymonthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_run_on')
  DateTime get nextRunOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_paused')
  @BoolConverter()
  bool get isPaused => throw _privateConstructorUsedError;

  /// Serializes this RecurringRuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurringRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurringRuleModelCopyWith<RecurringRuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringRuleModelCopyWith<$Res> {
  factory $RecurringRuleModelCopyWith(
          RecurringRuleModel value, $Res Function(RecurringRuleModel) then) =
      _$RecurringRuleModelCopyWithImpl<$Res, RecurringRuleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rule_id') int? ruleId,
      String uid,
      @JsonKey(name: 'template_json') String templateJson,
      RecurringFrequencyModel freq,
      int interval,
      String? byweekday,
      String? bymonthday,
      @JsonKey(name: 'next_run_on') DateTime nextRunOn,
      @JsonKey(name: 'is_paused') @BoolConverter() bool isPaused});
}

/// @nodoc
class _$RecurringRuleModelCopyWithImpl<$Res, $Val extends RecurringRuleModel>
    implements $RecurringRuleModelCopyWith<$Res> {
  _$RecurringRuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurringRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = freezed,
    Object? uid = null,
    Object? templateJson = null,
    Object? freq = null,
    Object? interval = null,
    Object? byweekday = freezed,
    Object? bymonthday = freezed,
    Object? nextRunOn = null,
    Object? isPaused = null,
  }) {
    return _then(_value.copyWith(
      ruleId: freezed == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      templateJson: null == templateJson
          ? _value.templateJson
          : templateJson // ignore: cast_nullable_to_non_nullable
              as String,
      freq: null == freq
          ? _value.freq
          : freq // ignore: cast_nullable_to_non_nullable
              as RecurringFrequencyModel,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      byweekday: freezed == byweekday
          ? _value.byweekday
          : byweekday // ignore: cast_nullable_to_non_nullable
              as String?,
      bymonthday: freezed == bymonthday
          ? _value.bymonthday
          : bymonthday // ignore: cast_nullable_to_non_nullable
              as String?,
      nextRunOn: null == nextRunOn
          ? _value.nextRunOn
          : nextRunOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurringRuleModelImplCopyWith<$Res>
    implements $RecurringRuleModelCopyWith<$Res> {
  factory _$$RecurringRuleModelImplCopyWith(_$RecurringRuleModelImpl value,
          $Res Function(_$RecurringRuleModelImpl) then) =
      __$$RecurringRuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rule_id') int? ruleId,
      String uid,
      @JsonKey(name: 'template_json') String templateJson,
      RecurringFrequencyModel freq,
      int interval,
      String? byweekday,
      String? bymonthday,
      @JsonKey(name: 'next_run_on') DateTime nextRunOn,
      @JsonKey(name: 'is_paused') @BoolConverter() bool isPaused});
}

/// @nodoc
class __$$RecurringRuleModelImplCopyWithImpl<$Res>
    extends _$RecurringRuleModelCopyWithImpl<$Res, _$RecurringRuleModelImpl>
    implements _$$RecurringRuleModelImplCopyWith<$Res> {
  __$$RecurringRuleModelImplCopyWithImpl(_$RecurringRuleModelImpl _value,
      $Res Function(_$RecurringRuleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurringRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = freezed,
    Object? uid = null,
    Object? templateJson = null,
    Object? freq = null,
    Object? interval = null,
    Object? byweekday = freezed,
    Object? bymonthday = freezed,
    Object? nextRunOn = null,
    Object? isPaused = null,
  }) {
    return _then(_$RecurringRuleModelImpl(
      ruleId: freezed == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      templateJson: null == templateJson
          ? _value.templateJson
          : templateJson // ignore: cast_nullable_to_non_nullable
              as String,
      freq: null == freq
          ? _value.freq
          : freq // ignore: cast_nullable_to_non_nullable
              as RecurringFrequencyModel,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      byweekday: freezed == byweekday
          ? _value.byweekday
          : byweekday // ignore: cast_nullable_to_non_nullable
              as String?,
      bymonthday: freezed == bymonthday
          ? _value.bymonthday
          : bymonthday // ignore: cast_nullable_to_non_nullable
              as String?,
      nextRunOn: null == nextRunOn
          ? _value.nextRunOn
          : nextRunOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringRuleModelImpl implements _RecurringRuleModel {
  const _$RecurringRuleModelImpl(
      {@JsonKey(name: 'rule_id') this.ruleId,
      required this.uid,
      @JsonKey(name: 'template_json') required this.templateJson,
      required this.freq,
      this.interval = 1,
      this.byweekday,
      this.bymonthday,
      @JsonKey(name: 'next_run_on') required this.nextRunOn,
      @JsonKey(name: 'is_paused') @BoolConverter() this.isPaused = false});

  factory _$RecurringRuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringRuleModelImplFromJson(json);

  @override
  @JsonKey(name: 'rule_id')
  final int? ruleId;
  @override
  final String uid;
  @override
  @JsonKey(name: 'template_json')
  final String templateJson;
  @override
  final RecurringFrequencyModel freq;
  @override
  @JsonKey()
  final int interval;
  @override
  final String? byweekday;
  @override
  final String? bymonthday;
  @override
  @JsonKey(name: 'next_run_on')
  final DateTime nextRunOn;
  @override
  @JsonKey(name: 'is_paused')
  @BoolConverter()
  final bool isPaused;

  @override
  String toString() {
    return 'RecurringRuleModel(ruleId: $ruleId, uid: $uid, templateJson: $templateJson, freq: $freq, interval: $interval, byweekday: $byweekday, bymonthday: $bymonthday, nextRunOn: $nextRunOn, isPaused: $isPaused)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringRuleModelImpl &&
            (identical(other.ruleId, ruleId) || other.ruleId == ruleId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.templateJson, templateJson) ||
                other.templateJson == templateJson) &&
            (identical(other.freq, freq) || other.freq == freq) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.byweekday, byweekday) ||
                other.byweekday == byweekday) &&
            (identical(other.bymonthday, bymonthday) ||
                other.bymonthday == bymonthday) &&
            (identical(other.nextRunOn, nextRunOn) ||
                other.nextRunOn == nextRunOn) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ruleId, uid, templateJson, freq,
      interval, byweekday, bymonthday, nextRunOn, isPaused);

  /// Create a copy of RecurringRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringRuleModelImplCopyWith<_$RecurringRuleModelImpl> get copyWith =>
      __$$RecurringRuleModelImplCopyWithImpl<_$RecurringRuleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringRuleModelImplToJson(
      this,
    );
  }
}

abstract class _RecurringRuleModel implements RecurringRuleModel {
  const factory _RecurringRuleModel(
          {@JsonKey(name: 'rule_id') final int? ruleId,
          required final String uid,
          @JsonKey(name: 'template_json') required final String templateJson,
          required final RecurringFrequencyModel freq,
          final int interval,
          final String? byweekday,
          final String? bymonthday,
          @JsonKey(name: 'next_run_on') required final DateTime nextRunOn,
          @JsonKey(name: 'is_paused') @BoolConverter() final bool isPaused}) =
      _$RecurringRuleModelImpl;

  factory _RecurringRuleModel.fromJson(Map<String, dynamic> json) =
      _$RecurringRuleModelImpl.fromJson;

  @override
  @JsonKey(name: 'rule_id')
  int? get ruleId;
  @override
  String get uid;
  @override
  @JsonKey(name: 'template_json')
  String get templateJson;
  @override
  RecurringFrequencyModel get freq;
  @override
  int get interval;
  @override
  String? get byweekday;
  @override
  String? get bymonthday;
  @override
  @JsonKey(name: 'next_run_on')
  DateTime get nextRunOn;
  @override
  @JsonKey(name: 'is_paused')
  @BoolConverter()
  bool get isPaused;

  /// Create a copy of RecurringRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringRuleModelImplCopyWith<_$RecurringRuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
