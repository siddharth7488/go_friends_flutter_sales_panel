import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/referred_users/reffered_users.dart';
import 'package:gofreindsgo_sales/services/reffereduser_service.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';

class ReferredUserViewModel extends ChangeNotifier {
  final ReferredUserService _service = ReferredUserService();
  ReferredUsers? _referralResponse;
  bool _isLoading = false;

  ReferredUsers? get referralResponse => _referralResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchReferralUsers() async {
    _isLoading = true;
    notifyListeners(); // Notify that loading has started

    try {
      _referralResponse =
          await _service.fetchReferralUsers(SharedPreferecesServices.token!);
      if (_referralResponse != null) {
        log('Referral users fetched successfully');
        // Example: Logging the name of the first referred user if it exists
        if (_referralResponse!.data!.referredUser.isEmpty) {
          log(_referralResponse!.data!.referredUser[0].salesId.toString());
        }
      }
    } catch (e) {
      // Handle error
      log('Error fetching referral users: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify that loading is complete
    }
  }
}
