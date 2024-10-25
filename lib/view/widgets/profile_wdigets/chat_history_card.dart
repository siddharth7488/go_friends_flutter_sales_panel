// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/chat_history_screen/chat_history_screen.dart';

class ChatHistoryWidgetCard extends StatelessWidget {
  const ChatHistoryWidgetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 130,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: CustomText(
                      text: 'Chat History',
                      fontFamily: CustomFonts.poppins,
                      size: 0.04,
                      color: AppColors.blackColor),
                )
              ],
            ),
            const CustomSizedBoxHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    PageNavigations().push(const ChatHistoryScreen());
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.notificationUnSelectedBarColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: CustomText(
                          text: 'Click Here',
                          fontFamily: CustomFonts.lato,
                          size: 0.04,
                          color: AppColors.blackColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
