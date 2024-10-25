import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/profile_image.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';

class MarriageAnniversaryContainer extends StatelessWidget {
  final ProfileViewModel value;
  const MarriageAnniversaryContainer(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value.onEditPressed
            ? value.dateSelection(FromDates.marriage, context)
            : null;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(54, 38, 8, 37)),
            borderRadius: BorderRadius.circular(12)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            value.newMarriageAnniversary ?? "Select the date",
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(Icons.calendar_month, color: AppColors.dateIconColor),
        ]),
      ),
    );
  }
}

class ProfileImageStack extends StatelessWidget {
  final ProfileViewModel value;
  final String imagePath;
  const ProfileImageStack(
    this.value, {
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ImageOfProfile(
        value: value,
        imagePath: imagePath,
      ),
      Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // value.onEditPressed ? value.addNewImage() : null;
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 231, 254, 1),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: Icon(Icons.camera_alt_outlined,
                  size: mediaquerywidth(0.06, context),
                  color: const Color.fromRGBO(165, 128, 199, 1)),
            ),
          ))
    ]);
  }
}
