import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofreindsgo_sales/model/user_model/user_details_model.dart';
import 'package:gofreindsgo_sales/services/sign_up_service.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/bottom_navigation_bar/bottom_navigation.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? otpCode;
  String? _message;
  String? get message => _message;
  String _sourceController = '';

  String get sourceController => _sourceController;

  set sourceController(String value) {
    _sourceController = value;
    notifyListeners();
  }

  Future<void> registerUser(UserDetails userDetails) async {
    log('reached');
    _isLoading = true;
    _message = null;
    notifyListeners();

    final response = await _userService.registerUser(userDetails);
    _isLoading = false;

    if (response != null && response['status'] == true) {
      _isLoading = false;
      _message = response['message'];
      log('successfully registered');
      // log(_message.toString());
      log(response['data']['user']['otp']);
      // PageNavigations().pushAndRemoveUntill(const BottomNavigationScreen());
    } else {
      _isLoading = false;
      _message = response?['message'] ?? 'Registration failed';
      Get.snackbar(
          "Validation error", response?['message'] ?? 'Registration failed',
          backgroundColor: Colors.red.shade400,
          colorText: AppColors.whiteColor);

      log('registration failed');
    }

    notifyListeners();
  }

  Future<void> loginUser(String userEmail, String password) async {
    log('started login fun');
    _isLoading = true;
    _message = null;
    notifyListeners();

    final response = await _userService.postEmail(userEmail, password);
    _isLoading = false;
    if (response.statusCode == 200) {
      // PageNavigations().push(OtpVerifyScreen(
      //   loginEmail: emailController.text,
      // ));
      PageNavigations().push(BottomNavigationScreen());
    } else {
      // Get.snackbar('some thing went wrong',);
    }
    log(response.body);
    notifyListeners();
  }

  Future<void> verifyOtp(int otp, String email) async {
    _isLoading = true;
    try {
      await _userService.verifyOtp(otp, email);

//  if(response.statusCode==200){}
      // Handle success
      // Update any state if needed
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      final response = await _userService.verifyOtp(otp, email);
      if (response.statusCode != 200) {
        _isLoading = false;
        notifyListeners();
      }
      // Update any state if needed
      notifyListeners();
    }
  }
}
