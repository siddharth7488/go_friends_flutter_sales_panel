import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/passport_model/passport_model.dart';
import 'package:gofreindsgo_sales/services/passport_service.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';

class PassportViewModel extends ChangeNotifier {
  final PassportService _service = PassportService();
  PassportModel? _passportResponse;
  bool _isLoading = false;

  PassportModel? get passportResponse => _passportResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchPassports() async {
    _isLoading = true;

    try {
      _passportResponse =
          await _service.fetchPassports(SharedPreferecesServices.token!);
      if (_passportResponse != null) {
        log('Passports fetched successfully');
        if (_passportResponse!.passports.isNotEmpty) {
          log(_passportResponse!.passports[0].title);
        }
      }

      notifyListeners();
    } catch (e) {
      log('Error fetching passports: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
