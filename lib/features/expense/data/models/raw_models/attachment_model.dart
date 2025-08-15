import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
class AttachmentModel with _$AttachmentModel {
  const factory AttachmentModel({
    @JsonKey(name: 'attachment_id') int? attachmentId,
    @JsonKey(name: 'transaction_id') required int transactionId,
    required String uri,
    @JsonKey(name: 'mime_type') String? mimeType,
    String? note,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}
