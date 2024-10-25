import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/story_display_screen/story_display_screen.dart';


class AppBarOfStoryViewScreen extends StatelessWidget {
  const AppBarOfStoryViewScreen({
    super.key,
    required this.widget,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final StoryDisplayScreen widget;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: AppColors.gradientColors),
      ),
      child: Column(
        children: [
          const CustomSizedBoxHeight(0.06),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidth(0.05, context)),
            child: Row(
              children: [
                Container(
                  width: mediaquerywidth(0.1, context),
                  height: mediaquerywidth(0.1, context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.whiteColor, width: 2),
                  ),
                ),
                const CustomSizedBoxWidth(0.03),
                CustomText(
                  text: widget.allStories[_currentIndex].title,
                  fontFamily: CustomFonts.roboto,
                  size: 0.055,
                  color: AppColors.whiteColor,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    PageNavigations().pop();
                  },
                  child: Icon(
                    size: mediaquerywidth(0.08, context),
                    Icons.close,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}