import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/home_screen/home_screen.dart';
// import 'package:gofreindsgo_sales/view/screens/home_screen/home_screen.dart';

AppBar appBarProfile() {
  return AppBar(
    backgroundColor: AppColors.transparentColor,
    title: const CustomText(
      text: "User Profile",
      fontFamily: CustomFonts.inter,
      size: 0.065,
      color: AppColors.blackColor,
      weight: FontWeight.w600,
    ),
  );
}

AppBar appBarChatHistory() {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          PageNavigations().pop();
        },
        icon: const Icon(Icons.arrow_back)),
    backgroundColor: AppColors.transparentColor,
    title: const CustomText(
      text: "Chat History",
      fontFamily: CustomFonts.inter,
      size: 0.05,
      color: AppColors.blackColor,
      weight: FontWeight.w600,
    ),
  );
}

AppBar appBarProfileOptions() {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          PageNavigations().push(const HomeScreen());
        },
        icon: const Icon(Icons.arrow_back)),
    backgroundColor: AppColors.transparentColor,
    title: const CustomText(
      text: "Profile",
      fontFamily: CustomFonts.inter,
      size: 0.05,
      color: AppColors.blackColor,
      weight: FontWeight.w600,
    ),
  );
}

AppBar appBarProfileEditingScreen() {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          PageNavigations().pop();
        },
        icon: const Icon(Icons.arrow_back)),
    backgroundColor: AppColors.transparentColor,
    title: const CustomText(
      text: "Edit Profile",
      fontFamily: CustomFonts.inter,
      size: 0.05,
      color: AppColors.blackColor,
      weight: FontWeight.w600,
    ),
  );
}
