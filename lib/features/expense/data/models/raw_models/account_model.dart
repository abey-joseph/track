import 'package:freezed_annotation/freezed_annotation.dart';
import 'json_converters.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

enum AccountTypeModel { 
  @JsonValue('CASH')
  cash, 
  @JsonValue('BANK')
  bank, 
  @JsonValue('CARD')
  card, 
  @JsonValue('EWALLET')
  ewallet, 
  @JsonValue('OTHER')
  other 
}

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    @JsonKey(name: 'account_id') int? accountId,
    required String uid,
    required String name,
    required AccountTypeModel type,
    required String currency,
    @JsonKey(name: 'is_archived') @BoolConverter() @Default(false) bool isArchived,
    @JsonKey(name: 'is_default') @BoolConverter() @Default(false) bool isDefault,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
