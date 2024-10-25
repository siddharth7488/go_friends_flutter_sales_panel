import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/constants/app_strings.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/profile_screen/profile_editing_screen.dart';

class ProfileCompletionStatus extends StatelessWidget {
  const ProfileCompletionStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        const CustomText(
            text: TextStrings.profileProgress,
            fontFamily: CustomFonts.poppins,
            size: 0.027,
            color: Color.fromRGBO(20, 20, 20, .6)),
        GestureDetector(
          onTap: () {
            PageNavigations().push(const ProfileEditingScreen());
          },
          child: const CustomText(
              text: TextStrings.addPhoto,
              fontFamily: CustomFonts.poppins,
              size: 0.027,
              color: Color.fromRGBO(21, 1, 154, 1)),
        )
      ],
    ),
    );
  }
}
