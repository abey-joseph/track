// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateModelImpl _$$ExchangeRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExchangeRateModelImpl(
      rateDate: DateTime.parse(json['rate_date'] as String),
      base: json['base'] as String,
      quote: json['quote'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExchangeRateModelImplToJson(
        _$ExchangeRateModelImpl instance) =>
    <String, dynamic>{
      'rate_date': instance.rateDate.toIso8601String(),
      'base': instance.base,
      'quote': instance.quote,
      'rate': instance.rate,
    };
