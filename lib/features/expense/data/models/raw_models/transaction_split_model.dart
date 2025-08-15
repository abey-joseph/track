import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_split_model.freezed.dart';
part 'transaction_split_model.g.dart';

@freezed
class TransactionSplitModel with _$TransactionSplitModel {
  const factory TransactionSplitModel({
    @JsonKey(name: 'split_id') int? splitId,
    @JsonKey(name: 'transaction_id') required int transactionId,
    @JsonKey(name: 'category_id') required int categoryId,
    required double amount,
    String? note,
  }) = _TransactionSplitModel;

  factory TransactionSplitModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionSplitModelFromJson(json);
}
