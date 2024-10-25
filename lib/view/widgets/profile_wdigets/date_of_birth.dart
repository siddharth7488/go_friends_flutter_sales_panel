import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';

class DateOfBirthContainer extends StatelessWidget {
  // final ProfileViewModel value;
  const DateOfBirthContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // value.onEditPressed
            // ? value.dateSelection(FromDates.dob, context)
        //     : null;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(54, 38, 8, 37)),
            borderRadius: BorderRadius.circular(12)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            ("Select the date"),
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(Icons.calendar_month, color: AppColors.dateIconColor),
        ]),
      ),
    );
  }
}
