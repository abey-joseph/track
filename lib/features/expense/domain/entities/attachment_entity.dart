class AttachmentEntity {
  final int? attachmentId;
  final int transactionId;
  final String uri;
  final String? mimeType;
  final String? note;

  const AttachmentEntity({
    this.attachmentId,
    required this.transactionId,
    required this.uri,
    this.mimeType,
    this.note,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AttachmentEntity &&
        other.attachmentId == attachmentId &&
        other.transactionId == transactionId &&
        other.uri == uri &&
        other.mimeType == mimeType &&
        other.note == note;
  }

  @override
  int get hashCode {
    return attachmentId.hashCode ^
        transactionId.hashCode ^
        uri.hashCode ^
        mimeType.hashCode ^
        note.hashCode;
  }

  AttachmentEntity copyWith({
    int? attachmentId,
    int? transactionId,
    String? uri,
    String? mimeType,
    String? note,
  }) {
    return AttachmentEntity(
      attachmentId: attachmentId ?? this.attachmentId,
      transactionId: transactionId ?? this.transactionId,
      uri: uri ?? this.uri,
      mimeType: mimeType ?? this.mimeType,
      note: note ?? this.note,
    );
  }
}
