// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isExpense: json['isExpense'] as bool,
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isExpense': instance.isExpense,
      'category': instance.category,
      'amount': instance.amount,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
    };
