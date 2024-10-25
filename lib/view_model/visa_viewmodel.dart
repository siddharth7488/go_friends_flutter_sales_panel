import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/visa_model/visa_model.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';
import 'package:gofreindsgo_sales/services/visa_service.dart';

class VisaViewModel extends ChangeNotifier {
  final VisaService _service = VisaService();
  VisaModel? _visaResponse;
  bool _isLoading = false;

  VisaModel? get visaResponse => _visaResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchVisas() async {
    _isLoading = true;
   

    try {
      _visaResponse = await _service.fetchVisas(SharedPreferecesServices.token!);
      if (_visaResponse != null) {
        log('Visas fetched successfully');
        if (_visaResponse!.visas.isNotEmpty) {
          log(_visaResponse!.visas[0].visaFor);
        }
      }
    
    } catch (e) {
      log('Error fetching visas: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
