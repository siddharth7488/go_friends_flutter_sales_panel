import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/model/home_grid_model.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';


class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
      child: SizedBox(
        height: mediaqueryheight(0.34, context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            final item = homeGridItems[index];
            return GestureDetector(
              onTap: () {
                // if (index == 0) {
                //   PageNavigations().push(const FixedDeparturesScreen());
                // } else if (index == 1) {
                //   PageNavigations().push(const PassportChecklistScreen());
                // } else if (index == 2) {
                //   PageNavigations().push(const VisaChecklistScreen());
                // } else {
                //   PageNavigations().push(const CabRatesScreen());
                // }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: mediaquerywidth(0.40, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomSizedBoxHeight(0.02),
                      SizedBox(
                          height: mediaqueryheight(0.1, context),
                          
                          child: Image.asset(item.imagePath,
                          
                          
                          )),
                      Column(
                        children: [
                          CustomText(
                            text: item.titleText,
                            fontFamily: CustomFonts.inter,
                            size: 0.03,
                            color: AppColors.blackColor,
                            weight: FontWeight.w700,
                          ),
                          const CustomSizedBoxHeight(0.01),
                          SizedBox(
                            height: mediaqueryheight(0.075, context),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomText(
                                  textAlign: TextAlign.center,
                                  text: item.subText,
                                  fontFamily: CustomFonts.inter,
                                  size: 0.022,
                                  color: AppColors.blackColor),
                            ),
                          ),
                          const CustomSizedBoxHeight(0.01),
                          Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight,
                                    colors: AppColors.gradientColors),
                                borderRadius: BorderRadius.circular(12)),
                            width: mediaquerywidth(0.23, context),
                            height: mediaqueryheight(0.04, context),
                            child: const Center(
                              child: CustomText(
                                  text: 'Get Details',
                                  fontFamily: CustomFonts.inter,
                                  size: 0.03,
                                  color: Colors.white),
                            ),
                          ),
                          const CustomSizedBoxHeight(0.02),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
