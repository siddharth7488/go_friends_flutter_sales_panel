import 'dart:convert';
import 'dart:developer';
import 'package:gofreindsgo_sales/model/target_model/target_model.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class TargetService {
  Future<TargetResponse> fetchTarget(String token) async {
    log('Fetching target from service file');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/target'), // Replace with actual endpoint
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return TargetResponse.fromJson(parsed);
      } else {
        log('Error: Failed to load target with status code ${response.statusCode}');
        throw Exception('Failed to load target');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load target: $e');
    }
  }
}
