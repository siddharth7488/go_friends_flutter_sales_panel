import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/screen_padding.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';

class BookingDetailsAppbar extends StatelessWidget {
  const BookingDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: commonScreenPadding(context),
        child: Column(children: [
          SizedBox(
            height: mediaqueryheight(0.05, context),
          ),
          Row(
            children: [
              IconButton(
                  iconSize: mediaquerywidth(0.08, context),
                  onPressed: () {
                    PageNavigations().pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.whiteColor,
                  )),
              const CustomSizedBoxWidth(0.02),
              const CustomText(
                  weight: FontWeight.bold,
                  text: "Bookings",
                  fontFamily: CustomFonts.roboto,
                  size: 0.055,
                  color: AppColors.whiteColor)
            ],
          ),
        ]),
      ),
    );
  }
}
