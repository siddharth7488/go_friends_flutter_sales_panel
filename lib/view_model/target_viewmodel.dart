import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/target_model/target_model.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';
import 'package:gofreindsgo_sales/services/target_service.dart';

class TargetViewModel extends ChangeNotifier {
  final TargetService _service = TargetService(); // Initialize the service
  TargetResponse? _targetResponse;
  bool _isLoading = false;

  TargetResponse? get targetResponse => _targetResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchTarget() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch target using the service
      _targetResponse =
          await _service.fetchTarget(SharedPreferecesServices.token!);

      if (_targetResponse != null) {
        log('Target fetched successfully');
        log('Target: ${_targetResponse!.data.target}');
      }
    } catch (e) {
      // Handle error
      log('Error fetching target: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
