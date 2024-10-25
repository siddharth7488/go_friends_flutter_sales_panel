import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofreindsgo_sales/utils/constants/app_strings.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showLogoutDialog() {
  Get.dialog(
    AlertDialog(
      title: const CustomText(
          text: 'Logout',
          fontFamily: CustomFonts.poppins,
          size: 0.06,
          color: Colors.black),
      content: const Text('Do you want to logout from GoFriendsGo?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog without any action
          },
          child: const CustomText(
              text: 'Cancel',
              fontFamily: CustomFonts.inter,
              size: 0.04,
              color: Colors.black),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setString(TextStrings.authToken, "");
            PageNavigations().pushAndRemoveUntill(LoginScreen());
          },
          child: const CustomText(
              text: 'Logout',
              fontFamily: CustomFonts.inter,
              size: 0.04,
              color: Colors.red),
        ),
      ],
    ),
    barrierDismissible: true,
  );
}
