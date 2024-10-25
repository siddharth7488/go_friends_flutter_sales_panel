import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/teams_model/teams_model.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';
import 'package:gofreindsgo_sales/services/teams_service.dart';

class TeamsViewModel extends ChangeNotifier {
  final TeamsService _service = TeamsService();
  TeamsResponse? _teamsResponse;
  bool _isLoading = false;

  TeamsResponse? get teamsResponse => _teamsResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchTeams() async {
    log('Fetching teams details from view model');
    _isLoading = true;

    try {
      _teamsResponse =
          await _service.fetchTeams(SharedPreferecesServices.token!);
      if (_teamsResponse != null) {
        log('Teams details fetched successfully');
        // Example: logging the name of the first team if it exists
        if (_teamsResponse!.data.teams.isNotEmpty) {
          log(_teamsResponse!.data.teams[0].designation);
        }
      }
      notifyListeners();
    } catch (e) {
      // Handle error
      log('Error fetching teams details: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has ended
    }
  }
}
