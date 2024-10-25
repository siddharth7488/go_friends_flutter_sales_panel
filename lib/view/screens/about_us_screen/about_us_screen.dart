import 'package:flutter/material.dart';


import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/mediaquery.dart';
import '../../../utils/constants/screen_padding.dart';
import '../../../utils/constants/sizedbox.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: AppColors.gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                height: mediaqueryheight(0.75, context),
                child: Padding(
                  padding: commonScreenPadding(context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      // const AboutUsAppBarElements(),
                      // const AboutUsFirstContent()
                    ],
                  ),
                ),
              ),
              const CustomSizedBoxHeight(0.03),
              Padding(
                padding: commonScreenPadding(context),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // OurStoryHeading(),
                    // CustomSizedBoxHeight(0.02),
                    // OurStoryTexts(TextStrings.ourStorySecondText),
                    // CustomSizedBoxHeight(0.02),
                    // OurStoryImage(),
                    // CustomSizedBoxHeight(0.02),
                    // OurStoryTexts(TextStrings.ourStorySecondText),
                
                    // OurStoryTexts(TextStrings.ourStoryThirdText),
                    //
                    // CustomSizedBoxHeight(0.02),
                    // FollowUsHeading(),
                    // CustomSizedBoxHeight(0.02),
                    // SocialMediaIcons(),
                    // CustomSizedBoxHeight(0.03),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
