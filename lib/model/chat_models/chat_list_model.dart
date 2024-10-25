class ChatsListModel {
  final bool status;
  final dynamic message;
  final List<ChatData> data;

  ChatsListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  // Modify the fromJson method to correctly access the "chats" array
  factory ChatsListModel.fromJson(Map<String, dynamic> json) {
    return ChatsListModel(
      status: json['status'],
      message: json['message'],
      // Access "chats" inside the "data" object
      data: List<ChatData>.from(
          json['data']['chats'].map((chat) => ChatData.fromJson(chat))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((chat) => chat.toJson()).toList(),
    };
  }
}

class ChatData {
  final int id;
  final dynamic name;
  final dynamic tag;
  final dynamic userId;
  final int? backendId;
  final dynamic status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChatData({
    required this.id,
    required this.name,
    required this.tag,
    required this.userId,
    this.backendId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatData.fromJson(Map<dynamic, dynamic> json) {
    return ChatData(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      userId: json['user_id'],
      backendId: json['backend_id'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'user_id': userId,
      'backend_id': backendId,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
