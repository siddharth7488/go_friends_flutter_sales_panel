class ChatMessage {
  final String id;
  final int chatId;
  final int fromId;
  final int toId;
  final String body;
  final String type;
  final String? attachment;
  final int seen;
  final String createdAt;
  final String updatedAt;

  ChatMessage({
    required this.id,
    required this.chatId,
    required this.fromId,
    required this.toId,
    required this.body,
    required this.type,
    this.attachment,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method for creating a ChatMessage from JSON
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      chatId: json['chat_id'],
      fromId: json['from_id'],
      toId: json['to_id'],
      body: json['body'],
      type: json['type'],
      attachment: json['attachment'],
      seen: json['seen'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
