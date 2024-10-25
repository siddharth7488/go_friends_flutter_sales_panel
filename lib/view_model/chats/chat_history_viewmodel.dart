import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gofreindsgo_sales/model/chat_models/chat_history_model.dart';
import 'package:gofreindsgo_sales/services/chats/chat_history_service.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> _messages = [];
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  final ChatService chatService = ChatService();

  Future<void> loadMessages() async {
    _isLoading = true;
    notifyListeners();

    try {
      _messages =
          await chatService.fetchMessages(SharedPreferecesServices.token!, 4);
      print('successfully chats fetched in viewmodel ${_messages[0].body}');
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
