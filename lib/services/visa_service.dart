import 'dart:convert';
import 'dart:developer';
import 'package:gofreindsgo_sales/model/visa_model/visa_model.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class VisaService {
  Future<VisaModel> fetchVisas(String token) async {
    log('Fetching visas from service file');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/visa'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return VisaModel.fromJson(parsed);
      } else {
        log('Error: Failed to load visas with status code ${response.statusCode}');
        throw Exception('Failed to load visas');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load visas: $e');
    }
  }
}
