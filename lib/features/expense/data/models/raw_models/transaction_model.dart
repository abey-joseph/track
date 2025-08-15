import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

enum TransactionTypeModel { expense, income, transfer }

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(name: 'transaction_id') int? transactionId,
    required String uid,
    @JsonKey(name: 'account_id') required int accountId,
    required TransactionTypeModel type,
    required double amount,
    required String currency,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'payee_id') int? payeeId,
    String? note,
    @JsonKey(name: 'occurred_on') required DateTime occurredOn,
    @JsonKey(name: 'occurred_at') DateTime? occurredAt,
    @JsonKey(name: 'transfer_group_id') String? transferGroupId,
    @JsonKey(name: 'has_split') @Default(false) bool hasSplit,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

