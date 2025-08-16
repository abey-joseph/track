import 'package:freezed_annotation/freezed_annotation.dart';

/// Converter for boolean fields that might be stored as integers in the database
class BoolConverter implements JsonConverter<bool, dynamic> {
  const BoolConverter();

  @override
  bool fromJson(dynamic json) {
    if (json is bool) return json;
    if (json is int) return json == 1;
    if (json is String) return json.toLowerCase() == 'true' || json == '1';
    return false;
  }

  @override
  dynamic toJson(bool object) => object ? 1 : 0;
}
