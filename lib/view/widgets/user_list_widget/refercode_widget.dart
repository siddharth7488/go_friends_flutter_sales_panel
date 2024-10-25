import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
// import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferCodeWidget extends StatelessWidget {
  final String title;
  const ReferCodeWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquerywidth(0.9, context),
      height: mediaqueryheight(0.21, context),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const CustomSizedBoxHeight(0.02),
          const CustomText(
              weight: FontWeight.w700,
              text: 'Refere Code',
              fontFamily: CustomFonts.roboto,
              size: 0.05,
              color: AppColors.blackColor),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const CustomSizedBoxHeight(0.01),
          const CustomText(
              text: 'Refer to the user',
              fontFamily: CustomFonts.roboto,
              size: 0.04,
              color: AppColors.blackColor),
          const CustomSizedBoxHeight(0.01),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: AppColors.notificationUnSelectedBarColor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: CustomText(
                  text: title,
                  fontFamily: CustomFonts.lato,
                  size: 0.04,
                  color: AppColors.blackColor),
            ),
          ),
          const CustomSizedBoxHeight(0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined),
              const CustomSizedBoxWidth(0.02),
              GestureDetector(
                onTap: () async {
                  const email = 'adinansayed@gmail.com';
                  const subject = 'Referral code';
                  final body = 'Here is the referral code. $title ';
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: email,
                    query: 'subject=$subject&body=$body',
                  );

                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  } else {
                    print('Could not launch email');
                  }
                },
                child: CustomText(
                    weight: FontWeight.w700,
                    text: 'Share this code through Email.',
                    fontFamily: CustomFonts.roboto,
                    size: 0.04,
                    color: AppColors.blackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
