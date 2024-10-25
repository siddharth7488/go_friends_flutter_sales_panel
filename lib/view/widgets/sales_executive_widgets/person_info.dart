import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/view/widgets/sales_executive_widgets/person_details.dart';


import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/custom_text.dart';
import '../../../utils/constants/paths.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../../view_model/sales_exe_viewmodel.dart';

class PersonInfo extends StatelessWidget {
  final SalesPersonViewModel value;
  const PersonInfo(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SalesExecutiveImage(),
        const CustomSizedBoxWidth(0.085),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SalesExecutiveName(value),
                const CustomSizedBoxWidth(0.02),
                const Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.fixedDeparturesAmberColor,
                ),
                const CustomSizedBoxWidth(0.02),
                const CustomText(
                    text: "4.5",
                    fontFamily: CustomFonts.roboto,
                    size: 0.035,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor)
              ],
            ),
            const CustomText(
                text: TextStrings.salesExecutive,
                fontFamily: CustomFonts.roboto,
                size: 0.04,
                color: Color.fromRGBO(60, 60, 60, 1)),
            const CustomSizedBoxHeight(0.01),
            ContactPhoneAndEmailLogo(value)
          ],
        )
      ],
    );
  }

}
