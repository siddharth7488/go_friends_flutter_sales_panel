import 'dart:convert';
import 'dart:developer';
import 'package:gofreindsgo_sales/model/referred_users/reffered_users.dart';
import 'package:http/http.dart' as http;

class ReferredUserService {
  Future<ReferredUsers> fetchReferralUsers(String token) async {
    log('Fetching referral users from service file');
    try {
      final response = await http.get(
        Uri.parse('https://gofriendsgo.teqsuit.com/api/sales/referral-users'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return ReferredUsers.fromJson(parsed);
      } else {
        log('Error: Failed to load referral users with status code ${response.statusCode}');
        throw Exception('Failed to load referral users');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load referral users: $e');
    }
  }
}
