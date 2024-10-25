import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/story_model/story_model.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/story_display_screen/story_display_screen.dart';


class StoryItem extends StatelessWidget {
  final List<Story> allStories;
  final int currentIndex;
  const StoryItem(
      {super.key, required this.allStories, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: mediaquerywidth(0.14, context),
          height: mediaquerywidth(0.14, context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(236, 147, 255, 1),
              width: 3.0,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              PageNavigations().push(StoryDisplayScreen(
                currentIndex: currentIndex,
                allStories: allStories,
              ));
            },
            child: ClipOval(
              child: Image.network(
                API.baseImageUrl+allStories[currentIndex].image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppImages.goFriendsGoLogo);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        CustomText(
          text: allStories[currentIndex].title,
          fontFamily: CustomFonts.poppins,
          size: 0.04,
          color: Colors.black,
        ),
      ],
    );
  }
}
