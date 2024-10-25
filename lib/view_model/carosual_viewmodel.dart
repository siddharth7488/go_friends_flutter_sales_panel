import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/carosual_model/carosual_model.dart';
import 'package:gofreindsgo_sales/services/carosual_fetch.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';

class CarosualViewModel extends ChangeNotifier {
  final CarousalsService _service = CarousalsService();
  CarouselsModel? _carouselsModel;
  bool _isLoading = false;

  CarouselsModel? get carouselsModel => _carouselsModel;
  bool get isLoading => _isLoading;

  Future<void> fetchCarousals() async {
    _isLoading = true;
 

    try {
      _carouselsModel = await _service.fetchCarousals(SharedPreferecesServices.token!);
      if (_carouselsModel != null) {
        log('Carousels fetched successfully');
        // For example, logging the title of the first carousel item if it exists
        if (_carouselsModel!.data.isNotEmpty) {
          log(_carouselsModel!.data[0].title);
        }
      }   notifyListeners();
    } catch (e) {
      // Handle error
      log('Error fetching carousals: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
