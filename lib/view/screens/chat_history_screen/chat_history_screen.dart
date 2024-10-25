import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/gradient_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/view/screens/chat_history_screen/message_screen.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/app_bar.dart';
import 'package:gofreindsgo_sales/view_model/chats/chat_list_viewmodel.dart';
import 'package:provider/provider.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChatHistory(),
      body: Consumer<ChatListViewmodel>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.chatsModel == null ||
              value.chatsModel!.data.isEmpty) {
            return const Center(
              child: Text('No chats available.'),
            );
          }

          return ListView.builder(
            itemCount: value.chatsModel!.data.length,
            itemBuilder: (context, index) {
              final chatListModels = value.chatsModel!.data[index];
              return GestureDetector(
                onTap: () {
                  Get.to(ChatScreen(
                    title: chatListModels.name ?? '',
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.blackColor),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomSizedBoxWidth(0.01),
                        Row(
                          children: [
                            Container(
                              width: mediaquerywidth(0.22, context),
                              height: mediaqueryheight(0.26, context),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        102, 145, 139, 139)),
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(AppImages.busIcon),
                              ),
                            ),
                            const CustomSizedBoxWidth(0.04),
                            Column(
                              children: [
                                const CustomSizedBoxHeight(0.02),
                                CustomText(
                                  text: chatListModels.name ?? "",
                                  fontFamily: CustomFonts.inter,
                                  size: 0.05,
                                  color: AppColors.blackColor,
                                ),
                                const CustomSizedBoxHeight(0.01),
                                CustomText(
                                  weight: FontWeight.w800,
                                  text: chatListModels.tag ?? '',
                                  fontFamily: CustomFonts.inter,
                                  size: 0.05,
                                  color: AppColors.blackColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const CustomSizedBoxWidth(0.01),
                        // const CustomSizedBoxWidth(0.05),

                        // const CustomSizedBoxWidth(0.28),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const CustomSizedBoxHeight(0.03),
                              const GradientText('4 min ',
                                  gradient: const LinearGradient(
                                      colors: AppColors.gradientColors),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              const CustomSizedBoxHeight(0.01),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: AppColors.dateIconColor,
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: CustomText(
                                      text: '1',
                                      fontFamily: CustomFonts.inter,
                                      size: 0.03,
                                      color: AppColors.whiteColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomSizedBoxWidth(0.01),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
