import 'package:flutter/material.dart';


import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/custom_text.dart';
import '../../../utils/constants/paths.dart';

class MeetTheTeamHeading extends StatelessWidget {
  final String heading;
  const MeetTheTeamHeading({
    required this.heading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: heading,
        fontFamily: CustomFonts.roboto,
        size: 0.05,
        weight: FontWeight.w600,
        color: AppColors.blackColor);
  }
}
