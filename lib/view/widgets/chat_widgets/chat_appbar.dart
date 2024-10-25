import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';

class ChatAppbar extends StatelessWidget {
  final String title;

  const ChatAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.21, context),
      decoration: const BoxDecoration(color: Colors.transparent
          // gradient: LinearGradient(
          //     colors: AppColors.gradientColors,
          //     begin: Alignment.centerRight,
          //     end: Alignment.centerLeft)
          ),
      child: Column(
        children: [
          SizedBox(
            height: mediaqueryheight(0.05, context),
          ),
          Row(
            children: [
              const CustomSizedBoxWidth(0.04),
              GestureDetector(
                onTap: () {
                  PageNavigations().pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.blackColor,
                  size: mediaquerywidth(0.07, context),
                ),
              ),
              const CustomSizedBoxWidth(0.02),
              Container(
                width: mediaquerywidth(0.09, context),
                height: mediaqueryheight(0.06, context),
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage(AppImages.busIcon))),
              ),
              const CustomSizedBoxWidth(0.03),
              Column(
                children: [
                  CustomText(
                      weight: FontWeight.w600,
                      text: title,
                      fontFamily: CustomFonts.inter,
                      size: 0.04,
                      color: Colors.black),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: AppColors.succesIconColor,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                          weight: FontWeight.w600,
                          text: 'Active',
                          fontFamily: CustomFonts.inter,
                          size: 0.03,
                          color: AppColors.succesIconColor),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
