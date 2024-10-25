import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/app_strings.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/navigations/navigations.dart';
import 'package:gofreindsgo_sales/view/screens/booking_screen/booking_screen.dart';
import 'package:gofreindsgo_sales/view/widgets/home_screen_widgets/drawer_widgets/showdialogu.dart';

import '../../../screens/about_us_screen/about_us_screen.dart';
import '../../../screens/gallery_screen/gallery_screen.dart';
import '../../../screens/sales_executive_screen/sales_executive_screen.dart';

class DrawerListItems extends StatelessWidget {
  const DrawerListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBoxHeight(0.02),
        Padding(
          padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
          child: const CustomText(
              text: TextStrings.myAccount,
              fontFamily: CustomFonts.roboto,
              size: 0.04,
              color: AppColors.onBoardingSubtitleColor),
        ),
        ListTile(
          leading: const Icon(Icons.home_filled),
          title: const Text(TextStrings.home),
          onTap: () {
            PageNavigations().pop();
          },
        ),
        ListTile(
          leading: const FaIcon(
            FontAwesomeIcons.briefcase,
            size: 20,
          ),
          title: const Text(TextStrings.myBookings),
          onTap: () {
            PageNavigations().push(const BookingDetailsScreen(
              fromBottomNav: false,
            ));
          },
        ),
        ListTile(
          leading: SvgPicture.asset(AppImages.personRaisedHand),

          title: const Text(TextStrings.salesExecutive),
          onTap: () {
             PageNavigations().push(const SalesExecutiveScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.groups_2_outlined),
          title: const Text(TextStrings.ourTeam),
          onTap: () {
            //PageNavigations().push(const MeetTheTeamScreen());
          },
        ),
        ListTile(
            onTap: () {
              PageNavigations().push(const GalleryScreen());
            },
            leading: const Icon(Icons.collections),
            title: const Text(TextStrings.gallery)),
        ListTile(
          leading: const Icon(Icons.star_half_rounded),
          title: const Text(TextStrings.rateUs),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.business),
          title: const Text(TextStrings.aboutUs),
          onTap: () {
             PageNavigations().push(const AboutUsScreen());
          },
        ),
        ListTile(
            onTap: () async {
              // final SharedPreferences sharedPreferences =
              //     await SharedPreferences.getInstance();
              // sharedPreferences.setString(TextStrings.authToken, "");
              // PageNavigations().pushAndRemoveUntill(LoginScreen());
              showLogoutDialog();
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text(TextStrings.logout)),
      ],
    );
  }
}
