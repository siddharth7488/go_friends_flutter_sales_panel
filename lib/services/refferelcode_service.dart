import 'dart:convert';
import 'dart:developer';

import 'package:gofreindsgo_sales/model/referrelcode_model/refferelcode_model.dart';
import 'package:http/http.dart' as http;
// import 'package:gofreindsgo_sales/services/api/app_apis.dart';

class ReferralService {
  Future<ReferralResponse> fetchReferralCode(String token) async {
    log('Fetching referral code from service file');
    try {
      final response = await http.get(
        Uri.parse('https://gofriendsgo.teqsuit.com/api/sales/referral'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return ReferralResponse.fromJson(parsed);
      } else {
        log('Error: Failed to load referral code with status code ${response.statusCode}');
        throw Exception('Failed to load referral code');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load referral code: $e');
    }
  }
}
