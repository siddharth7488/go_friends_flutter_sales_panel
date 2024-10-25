import 'dart:convert';
import 'package:gofreindsgo_sales/model/chat_models/chat_history_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final String baseUrl =
      'https://gofriendsgo.teqsuit.com/api/sales/fetchMessages';

  Future<List<ChatMessage>> fetchMessages(String authToken, int chatId) async {
    // Define the request body including the chat_id
    final requestBody = jsonEncode({
      'chat_id': chatId,
    });

    // Make the POST request with the request body
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type':
            'application/json', // Ensure content-type is set for JSON body
      },
      body: requestBody,
    );

    // Print the response for debugging
    print('Chats: ${response.body}');

    // Check if the response status is 200 (success)
    if (response.statusCode == 200) {
      // Decode the entire response
      final jsonData = json.decode(response.body);
      print('this is $jsonData');
      // Check if the 'messages' key exists
      if (jsonData.containsKey('messages')) {
        // Access the 'messages' array inside the response
        List<dynamic> messagesData = jsonData['messages'];

        // Map the messages to ChatMessage objects
        return messagesData
            .map((message) =>
                ChatMessage.fromJson(message as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('No messages found in response');
      }
    } else {
      throw Exception('Failed to load messages');
    }
  }
}
