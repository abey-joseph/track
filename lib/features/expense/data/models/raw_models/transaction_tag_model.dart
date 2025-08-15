import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_tag_model.freezed.dart';
part 'transaction_tag_model.g.dart';

@freezed
class TransactionTagModel with _$TransactionTagModel {
  const factory TransactionTagModel({
    @JsonKey(name: 'transaction_id') required int transactionId,
    @JsonKey(name: 'tag_id') required int tagId,
  }) = _TransactionTagModel;

  factory TransactionTagModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionTagModelFromJson(json);
}
