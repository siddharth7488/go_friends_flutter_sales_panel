
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/custom_text.dart';
import '../../../utils/constants/mediaquery.dart';
import '../../../utils/constants/paths.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../../view_model/sales_exe_viewmodel.dart';

class SalesExecutiveName extends StatelessWidget {
  final SalesPersonViewModel value;
  const SalesExecutiveName(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: value.salesPersonResponse?.data.name ?? "",
        fontFamily: CustomFonts.roboto,
        size: 0.05,
        weight: FontWeight.w500,
        color: AppColors.blackColor);
  }
}

class ContactPhoneAndEmailLogo extends StatelessWidget {
  final SalesPersonViewModel value;
  const ContactPhoneAndEmailLogo(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _sendEmail(value.salesPersonResponse!.data.email);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundColor),
                borderRadius: BorderRadius.circular(90)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.email_outlined,
                size: mediaquerywidth(0.06, context),
              ),
            ),
          ),
        ),
        const CustomSizedBoxWidth(0.02),
        GestureDetector(
          onTap: () {
            _launchDialer(value.salesPersonResponse!.data.phone);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundColor),
                borderRadius: BorderRadius.circular(90)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.call,
                size: mediaquerywidth(0.06, context),
              ),
            ),
          ),
        )
      ],
    );
  }

  _sendEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  _launchDialer(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

class SalesExecutiveImage extends StatelessWidget {
  // final SalesPersonViewModel value;
  const SalesExecutiveImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquerywidth(0.2, context),
      height: mediaqueryheight(0.12, context),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        shape: BoxShape.circle,
        // image: DecorationImage(
        //     image: NetworkImage(
        //   value.salesPersonResponse!.data.profilePic != null
        //       ? API.baseImageUrl + value.salesPersonResponse!.data.profilePic!
        //       : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVeVNrw_5JYx80ESLOHIVIyBbaeZxtXaJK9A&s',
        // ))
      ),
      // child: Consumer<SalesPersonViewModel>(
      //   builder: (context, value, child) => CachedNetworkImage(
      //     imageUrl:
      //         API.baseImageUrl + value.salesPersonResponse!.data.profilePic!,
      //     progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //       child: CircularProgressIndicator(value: downloadProgress.progress),
      //     ),
      //     errorWidget: (context, url, error) =>
      //         Image.asset(AppImages.tripImage),
      //   ),
      // ),
    );
  }
}
