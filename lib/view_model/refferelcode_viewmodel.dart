import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/referrelcode_model/refferelcode_model.dart';
import 'package:gofreindsgo_sales/services/refferelcode_service.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart'; // Import shared preferences for token

class ReferralViewModel extends ChangeNotifier {
  final ReferralService _service = ReferralService(); // Initialize the service
  ReferralResponse? _referralResponse;
  bool _isLoading = false;

  ReferralResponse? get referralResponse => _referralResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchReferralCode() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch referral code using the service
      _referralResponse =
          await _service.fetchReferralCode(SharedPreferecesServices.token!);

      if (_referralResponse != null) {
        log('Referral code fetched successfully');
        log('Referral Code: ${_referralResponse!.data.referralCode}');
      }
    } catch (e) {
      // Handle error
      log('Error fetching referral code: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
