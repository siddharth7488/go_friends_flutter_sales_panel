import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/view/screens/profile_screen/user_profile.dart';
import 'package:gofreindsgo_sales/view/widgets/home_screen_widgets/drawer_widgets/back_button.dart';
import 'package:gofreindsgo_sales/view/widgets/home_screen_widgets/home_appbar.dart';
import 'package:gofreindsgo_sales/view/widgets/user_list_widget/refercode_widget.dart';
import 'package:gofreindsgo_sales/view_model/reffered_user_viewmodel.dart';
import 'package:gofreindsgo_sales/view_model/refferelcode_viewmodel.dart';
import 'package:gofreindsgo_sales/view_model/target_viewmodel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const HomeAppbar(
            title: 'User List',
          )),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(height: 1, color: const Color.fromARGB(255, 63, 27, 80)),
          // const Divider(
          //   thickness: 0,
          // ),
          Stack(children: [
            SizedBox(
                width: double.infinity,
                height: mediaqueryheight(0.36, context)),
            const TextPositioned(),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: mediaqueryheight(0.11, context)),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.containerColor,
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        height: mediaqueryheight(0.27, context),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Consumer<ReferralViewModel>(
                                builder: (context, value, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                        text: value.referralResponse!.data
                                            .referralCode,
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Referral code copied to clipboard!'),
                                        ),
                                      );
                                    },
                                    child: ReferCodeWidget(
                                      title: value
                                          .referralResponse!.data.referralCode,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      const CustomSizedBoxHeight(0.14),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.containerColor,
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        height: mediaqueryheight(0.30, context),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const CustomSizedBoxHeight(0.01),
                              Consumer<ReferralViewModel>(
                                builder: (context, value, child) {
                                  return Container(
                                    width: mediaquerywidth(0.9, context),
                                    height: mediaqueryheight(0.25, context),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                  weight: FontWeight.w700,
                                                  text: 'Targets',
                                                  fontFamily:
                                                      CustomFonts.poppins,
                                                  size: 0.04,
                                                  color: AppColors.blackColor)
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          indent: 20,
                                          endIndent: 20,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 60.0,
                                          lineWidth: 5.0,
                                          percent: 0.1,
                                          center: const Text("100%"),
                                          progressColor: Colors.green,
                                        ),
                                        const CustomSizedBoxHeight(0.02),
                                        Consumer<TargetViewModel>(
                                          builder: (context, value, child) {
                                            return CustomText(
                                                weight: FontWeight.w700,
                                                text:
                                                    '₹ ${value.targetResponse!.data.target.toString()}',
                                                fontFamily: CustomFonts.lato,
                                                size: 0.04,
                                                color: Colors.black);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          const CustomSizedBoxHeight(0.02),
          const Padding(
            padding: EdgeInsets.only(left: 13),
            child: CustomText(
                weight: FontWeight.w600,
                text: 'Users',
                fontFamily: CustomFonts.inknut,
                size: 0.04,
                color: AppColors.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ReferredUserViewModel>(
              builder: (context, value, child) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.referralResponse!.data!.referredUser.length,
                  itemBuilder: (context, index) {
                    final user =
                        value.referralResponse!.data!.referredUser[index];

                    return GestureDetector(
                      onTap: () {
                        Get.to(UserProfileScreen(
                          imagePath: user.user.profilePic,
                          phone: user.user.phone,
                          name: user.user.name,
                          email: user.user.email,
                          conmpanyName: user.user.companyName ?? 'company',
                          dob: user.user.dob ?? "DOB",
                        ));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    AppColors.notificationUnSelectedBarColor),
                            borderRadius: BorderRadius.circular(14),
                            color: AppColors.whiteColor,
                          ),
                          width: mediaquerywidth(0.05, context),
                          height: mediaqueryheight(0.08, context),
                          child: Column(
                            children: [
                              const CustomSizedBoxHeight(0.014),
                              Row(
                                children: [
                                  Container(
                                    width: mediaquerywidth(0.20, context),
                                    height: mediaqueryheight(0.05, context),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                API.baseImageUrl +
                                                    user.user.profilePic)),
                                        color: AppColors.containerColor,
                                        shape: BoxShape.circle),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(
                                              text: user.user.name,
                                              fontFamily: CustomFonts.poppins,
                                              size: 0.04,
                                              color: AppColors.blackColor),
                                          const CustomSizedBoxWidth(0.02),
                                          const Icon(
                                            Icons.verified,
                                            color: AppColors.succesIconColor,
                                          )
                                        ],
                                      ),
                                      CustomText(
                                          text: user.user.referral ??
                                              'refferel code',
                                          fontFamily: CustomFonts.poppins,
                                          size: 0.03,
                                          color: const Color.fromARGB(
                                              102, 109, 103, 103)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
