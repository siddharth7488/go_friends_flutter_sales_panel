import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../utils/color_theme/colors.dart';
import '../../../utils/constants/app_bar.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/mediaquery.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../../view_model/sales_exe_viewmodel.dart';
import '../../widgets/sales_executive_widgets/first_section.dart';
import '../../widgets/sales_executive_widgets/second_section.dart';
import '../../widgets/sales_executive_widgets/third_section.dart';

class SalesExecutiveScreen extends StatefulWidget {
  const SalesExecutiveScreen({super.key});

  @override
  State<SalesExecutiveScreen> createState() => _SalesExecutiveScreenState();
}

class _SalesExecutiveScreenState extends State<SalesExecutiveScreen> {
  @override
  void initState() {
    context.read<SalesPersonViewModel>().fetchSalesPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.1, context)),
          child: const CommonGradientAppBar(
            heading: TextStrings.salesExecutive,
            fromBottomNav: false,
          )),
      body: Consumer<SalesPersonViewModel>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            const CustomSizedBoxHeight(0.015),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaqueryheight(0.02, context),
                  horizontal: mediaquerywidth(0.04, context)),
              child:  Column(
                children: [
                  FirstSectionInSalesExecutiveSection(value),
                  const CustomSizedBoxHeight(0.04),
                  const SecondSection(),
                  const CustomSizedBoxHeight(0.04),
                  const ThirdSection(),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
