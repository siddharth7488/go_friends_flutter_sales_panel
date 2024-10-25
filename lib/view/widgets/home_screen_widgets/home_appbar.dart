import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';

class HomeAppbar extends StatelessWidget {
  final String title;
  const HomeAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.18, context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: AppColors.gradientColors,
        ),
      ),
      child: Column(
        children: [
          const CustomSizedBoxHeight(0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomSizedBoxWidth(0.04),
                  GestureDetector(
                      onTap: () {
                        print('clicked this');
                        Scaffold.of(context).openDrawer();
                      },
                      child:
                          const Icon(Icons.menu, color: AppColors.whiteColor)),
                  const CustomSizedBoxWidth(0.05),
                  CustomText(
                      weight: FontWeight.bold,
                      text: title,
                      fontFamily: CustomFonts.roboto,
                      size: 0.05,
                      color: AppColors.whiteColor)
                ],
              ),
              const CustomSizedBoxWidth(0.05),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppImages.notificationsUnread)),
                  const CustomSizedBoxWidth(0.09),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
