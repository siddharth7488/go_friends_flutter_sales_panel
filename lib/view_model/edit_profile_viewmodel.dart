import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/services/edit_profile_service.dart';
import 'package:gofreindsgo_sales/services/shared_preferences.dart';

class EditProfileViewmodel extends ChangeNotifier {
  final EditProfileService _profileService = EditProfileService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Update user profile data
  updateUserProfile(profileData) async {
    EditProfileService editProfileService = EditProfileService();

    Map<String, dynamic> response = await editProfileService.updateProfile(
        '3', profileData, SharedPreferecesServices.token!);

    if (response['success']) {
      log('erroooooorrrr editing ${response['message']}'); // Output: Profile updated successfully
      print(response['data']); // Output: Response data from the server
    } else {
      print(
          'Error from edit viewmodel: ${response['message']}'); // Output error message
    }
  }
}
