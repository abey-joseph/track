import 'package:freezed_annotation/freezed_annotation.dart';

part 'payee_model.freezed.dart';
part 'payee_model.g.dart';

@freezed
class PayeeModel with _$PayeeModel {
  const factory PayeeModel({
    @JsonKey(name: 'payee_id') int? payeeId,
    required String uid,
    required String name,
    String? normalized,
  }) = _PayeeModel;

  factory PayeeModel.fromJson(Map<String, dynamic> json) =>
      _$PayeeModelFromJson(json);
}
