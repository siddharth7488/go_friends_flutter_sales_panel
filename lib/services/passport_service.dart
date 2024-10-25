import 'dart:convert';
import 'dart:developer';
import 'package:gofreindsgo_sales/model/passport_model/passport_model.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class PassportService {

  Future<PassportModel> fetchPassports(String token) async {
    log('Fetching passports from service file');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/passport'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return PassportModel.fromJson(parsed);
      } else {
        log('Error: Failed to load passports with status code ${response.statusCode}');
        throw Exception('Failed to load passports');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load passports: $e');
    }
  }
}
