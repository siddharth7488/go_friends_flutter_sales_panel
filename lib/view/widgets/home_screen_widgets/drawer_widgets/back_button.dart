import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';

class BackButtonOnDrawer extends StatelessWidget {
  const BackButtonOnDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: mediaqueryheight(0.19, context),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: AppColors.gradientColors)),
          child: Align(
            alignment: const Alignment(-.9, -0.3),
            child: GestureDetector(
              onTap: () {
                PageNavigations().pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.whiteColor,
                size: mediaquerywidth(0.07, context),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: mediaqueryheight(0.18, context),
          decoration: const BoxDecoration(color: AppColors.backgroundColor),
        ),
      ],
    ));
  }
}

class TextPositioned extends StatelessWidget {
  const TextPositioned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: mediaqueryheight(0.19, context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: AppColors.gradientColors,
            ),
          ),
          child: const Align(
            alignment:  Alignment(-.9, -0.3),
            child: CustomText(
                weight: FontWeight.w500,
                text: 'Overview',
                fontFamily: CustomFonts.roboto,
                size: 0.06,
                color: AppColors.whiteColor),
          ),
        ),
        Container(
          width: double.infinity,
          height: mediaqueryheight(0.18, context),
          decoration: const BoxDecoration(color: AppColors.backgroundColor),
        ),
      ],
    ));
  }
}
