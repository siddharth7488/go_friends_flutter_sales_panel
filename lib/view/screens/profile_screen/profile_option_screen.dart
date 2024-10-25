import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/constants/text_controllers.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/profile_screen/profile_editing_screen.dart';
import 'package:gofreindsgo_sales/view/widgets/home_screen_widgets/drawer_widgets/showdialogu.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/app_bar.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/marriage_anniversary.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileOptionScreen extends StatelessWidget {
  const ProfileOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProfileOptions(),
      backgroundColor: AppColors.whiteColor,
      body: Consumer<ProfileViewModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImageStack(value, imagePath: value.profilePic ?? ''),
              const CustomSizedBoxHeight(0.02),
              CustomText(
                text: nameController.text,
                fontFamily: CustomFonts.roboto,
                size: 0.055,
                color: AppColors.blackColor,
                weight: FontWeight.w900,
              ),
              ListView(shrinkWrap: true, children: [
                const CustomSizedBoxHeight(0.02),
                ListTile(
                    onTap: () {
                      PageNavigations().push(const ProfileEditingScreen());
                    },
                    leading: const Image(
                        image: AssetImage('assets/images/Frame 402.png')),
                    title: const CustomText(
                      color: AppColors.blackColor,
                      text: 'Edit Profile',
                      fontFamily: CustomFonts.roboto,
                      size: 0.04,
                    )),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const CustomSizedBoxHeight(0.02),
                const ListTile(
                    leading: Image(
                        image: AssetImage('assets/images/notifications.png')),
                    title: CustomText(
                      color: AppColors.blackColor,
                      text: 'Notifications',
                      fontFamily: CustomFonts.roboto,
                      size: 0.04,
                    )),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const CustomSizedBoxHeight(0.02),
                ListTile(
                    onTap: () {
                      showLogoutDialog();
                    },
                    leading: const Image(
                        image: AssetImage('assets/images/Frame 404.png')),
                    title: const CustomText(
                      color: AppColors.blackColor,
                      text: 'Logout',
                      fontFamily: CustomFonts.roboto,
                      size: 0.04,
                    )),
              ])
            ],
          );
        },
      ),
    );
  }
}
