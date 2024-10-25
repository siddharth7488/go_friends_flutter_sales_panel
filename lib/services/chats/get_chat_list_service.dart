import 'dart:convert';
import 'dart:developer';
import 'package:gofreindsgo_sales/model/chat_models/chat_list_model.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class ChatServices {
  Future<ChatsListModel> fetchChats(String token) async {
    log('Fetching chats from service filesss');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/chats'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return ChatsListModel.fromJson(parsed);
      } else {
        log('Error: Failed to load chats with status code ${response.statusCode}');
        throw Exception('Failed to load chats');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load chats: $e');
    }
  }
}
