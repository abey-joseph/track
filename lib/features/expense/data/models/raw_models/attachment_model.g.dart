// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentModelImpl _$$AttachmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachmentModelImpl(
      attachmentId: (json['attachment_id'] as num?)?.toInt(),
      transactionId: (json['transaction_id'] as num).toInt(),
      uri: json['uri'] as String,
      mimeType: json['mime_type'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$AttachmentModelImplToJson(
        _$AttachmentModelImpl instance) =>
    <String, dynamic>{
      'attachment_id': instance.attachmentId,
      'transaction_id': instance.transactionId,
      'uri': instance.uri,
      'mime_type': instance.mimeType,
      'note': instance.note,
    };
