import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/view/widgets/sales_executive_widgets/person_info.dart';


import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/custom_text.dart';
import '../../../utils/constants/paths.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../../view_model/sales_exe_viewmodel.dart';

class FirstSectionInSalesExecutiveSection extends StatelessWidget { 
 final SalesPersonViewModel value; 
  const FirstSectionInSalesExecutiveSection(this.value,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteColor),
        padding: const EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonInfo(value),
            const CustomSizedBoxHeight(0.035),
            const CustomText(
              text: TextStrings.about,
              fontFamily: CustomFonts.roboto,
              size: 0.04,
              color: Color.fromRGBO(0, 0, 0, 0.8),
              weight: FontWeight.w500,
            ),
            const CustomSizedBoxHeight(0.01),
            const CustomText(
              text: TextStrings.salesExecutiveAboutDetails,
              fontFamily: CustomFonts.roboto,
              size: 0.04,
              color: Color.fromRGBO(0, 0, 0, 0.6),
            )
          ],
        ),
      ),
    );
  }
}