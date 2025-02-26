// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: (json['id'] as num).toInt(),
      isExpense: json['isExpense'] as bool,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isExpense': instance.isExpense,
      'title': instance.title,
      'amount': instance.amount,
      'category': instance.category,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
    };
