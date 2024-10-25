import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileService {
  final String baseUrl = "https://gofriendsgo.teqsuit.com/api/sales/profile/";

  // Function to update profile using PATCH request with Authorization Token
  Future<Map<String, dynamic>> updateProfile(
      String id, Map<String, dynamic> data, String token) async {
    final String url = "$baseUrl$id"; // Use dynamic ID in the URL

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return {
          'success': true,
          'message': 'Profile updated successfully',
          'data': responseData
        }; // Return success with data
      } else {
        // Handle errors from the server (e.g., validation issues)
        final errorData = json.decode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Profile ',
          'data': errorData
        }; // Return failure with error message
      }
    } catch (e) {
      print("Error updating profile: $e");
      return {
        'success': false,
        'message': 'An error occurred: $e',
        'data': null
      }; // Return failure with exception message
    }
  }
}
